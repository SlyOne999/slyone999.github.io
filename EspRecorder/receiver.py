import socket
import struct
import time
import os
import shutil
from datetime import datetime, timedelta
import numpy as np
import soundfile as sf

ESP32_IP = "192.168.4.1"
ESP32_PORT = 8080
SAMPLE_RATE = 16000
CHANNELS = 1
BLOCK_SIZE = 512
RETENTION_DAYS = 7 

def clean_old_recordings(base_dir):
    if not os.path.exists(base_dir):
        return
    cutoff_date = datetime.now() - timedelta(days=RETENTION_DAYS)
    for item in os.listdir(base_dir):
        item_path = os.path.join(base_dir, item)
        if os.path.isdir(item_path):
            try:
                folder_date = datetime.strptime(item, "%Y-%m-%d")
                if folder_date < cutoff_date:
                    shutil.rmtree(item_path)
            except ValueError:
                continue

def get_target_filepath():
    base_dir = "recordings"
    clean_old_recordings(base_dir)
    date_folder = time.strftime("%Y-%m-%d")
    target_dir = os.path.join(base_dir, date_folder)
    os.makedirs(target_dir, exist_ok=True)
    return os.path.join(target_dir, f"stream_{time.strftime('%H%M%S')}.wav")

def run_segmented_receiver():
    print("Listening loop initialized. Waiting for ESP32 activity...")
    while True:
        try:
            client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            client_socket.settimeout(5.0)
            client_socket.connect((ESP32_IP, ESP32_PORT))
            save_path = get_target_filepath()
            print(f"\n[!] Connection established! Saving to: {save_path}")
            
            with sf.SoundFile(save_path, mode='w', samplerate=SAMPLE_RATE, channels=CHANNELS, subtype='PCM_16') as wav_file:
                while True:
                    raw_data = client_socket.recv(BLOCK_SIZE * 2)
                    if not raw_data:
                        break
                    num_samples = len(raw_data) // 2
                    pcm_data = struct.unpack(f"{num_samples}h", raw_data[:num_samples * 2])
                    audio_array = np.array(pcm_data, dtype=np.int16).astype(np.float32) / 32768.0
                    wav_file.write(audio_array)
            print(f"[-] Session finished. File finalized.")
        except (socket.error, socket.timeout):
            time.sleep(1)
        except KeyboardInterrupt:
            break

if __name__ == "__main__":
    run_segmented_receiver()
