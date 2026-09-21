# ESP32 Wireless Audio Streaming Hotspot #

## Description ##
An open-source, ultra-portable wireless audio transmitter that captures high-quality live audio using an I2S digital MEMS microphone and streams it over a private, standalone Wi-Fi Access Point (AP). 

The system features dynamic external sensor wakeups (PIR/vibration) to conserve battery, hardware status LEDs, an integrated battery telemetry monitor, and a Python client script to save incoming recordings automatically into organized, dated folders.

The ESP32 Wireless Audio Streaming Hotspot (also referred to as the ESP Recorder) is an open-source, ultra-portable hardware bugging and acoustic surveillance platform. Built using a low-cost ESP32 microcontroller and a digital MEMS microphone, it records live environmental audio and streams it remotely over a private, standalone Wi-Fi network.

## Usage ## 
The device acts as a covert, standalone listening post that monitors physical spaces and pushes live feeds to a remote receiver:

### High-Fidelity Audio Capture ###
Uses an INMP441 I2S digital MEMS microphone module to intercept crisp, high-quality audio directly from its surroundings.

### Standalone Wi-Fi Hotspot ###
Spins up its own private Wi-Fi Access Point (ESP32_S3_Audio_Mic), removing the need for a local internet connection or router.

### Sensor-Driven Wakeups ###
Connects to dynamic external sensors—like the AM312 Mini PIR motion sensor or SW-420 vibration sensor—to stay asleep until movement or physical vibrations trigger active streaming.

### Automated Python Logging ###
Pairs with a desktop client script that automatically captures the raw network audio stream, processes it into standard .wav files, and manages disk space by auto-deleting records older than 7 days.

### Long-Term Battery Operation ###
Combines deep sleep modes with integrated battery telemetry scaling and a TP4056 lithium charging module to run covertly for extended periods.
    
## Attacks ##

### Audio Eavesdropping & Room Bugging ###

** Acoustic Surveillance **
    
Deploying the non-metallic, disguised enclosure into a room, vehicle, or workspace to actively record conversations. The operator sits safely out of sight within Wi-Fi range to pull the live feed via a connected laptop.

### Event-Triggered Reconnaissance ###

** Motion & Boundary Alerts **
        
Configuring the system to wake up exclusively when someone approaches an asset (using the PIR module) or opens a desk drawer/door (using the vibration sensor). This lets attackers map out exactly when physical security boundaries are being breached without wasting battery power.

### Continuous Room Logging ###

** Automated Exfiltration **
        
Leveraging the companion script to automatically dump daily audio logs into neatly indexed folders on a remote host. This enables seamless, continuous archiving of space telemetry over days or weeks.

---

## 🛠️ Global Project Shopping List (BOM)

### Core Microcontrollers (Choose your build variant)
*   **ESP32-S3 Variant:** 1x ESP32-S3 Development Board (e.g., *ESP32-S3-DevKitC-1* or *Seeed Studio XIAO ESP32S3*)
*   **Standard Variant:** 1x Standard ESP32 Development Board (Specifically the 30-pin ESP-WROOM-32 / NodeMCU board variant)

### Audio & Sensors
*   1x INMP441 I2S Digital MEMS Microphone Module
*   1x Wakeup Sensor (Choose based on your deployment needs):
    *   *Option A:* AM312 Mini PIR Motion Sensor Module (Infrared motion trigger)
    *   *Option B:* SW-420 Vibration Sensor Module (Physical movement/vibration trigger)

### Power & Battery Management
*   1x TP4056 Lithium Battery Charger Module (Type-C USB port with integrated battery protection circuitry)
*   1x 3.7V Lithium Battery (e.g., *3.7V LiPo Battery 1200mAh+* or *18650 Li-ion Cell 3500mAh*)
*   1x SPDT Miniature Slide Switch

### Discrete Electronic Components
*   2x 100kΩ Resistors (1/4 Watt, 1% tolerance for precise battery ADC scaling)
*   2x 220Ω Resistors (1/4 Watt, for LED current limiting)
*   1x 3mm or 5mm Blue LED (Active status indicator)
*   1x 3mm or 5mm Red LED (Sleep transition indicator)

### Prototyping Hardware
*   1x Double-Sided Perfboard / Prototyping PCB (approx. 5x7 cm)
*   1x ABS Plastic Project Box / Enclosure (Non-metal to prevent Wi-Fi signal blockage)
*   1x Roll of 24 AWG Hook-up Wire

---

## 📐 Select Your Hardware Build Variant

This project supports two different hardware branches. Click on the module you are using to access its custom source code, unique wiring pinout, and build instructions:

*   ### [👉 Option 1: Modern Build Guide (ESP32-S3)](./ESP32-S3)
    *Uses the modern, robust `driver/i2s_std.h` hardware library.*

*   ### [👉 Option 2: Legacy Build Guide (Standard Non-S3 ESP32)](./ESP32-Standard)
    *Uses the legacy monolithic `driver/i2s.h` driver for older generation hardware.*

---

## 💻 Python Desktop Receiver Client

Run this Python script on a computer connected to your ESP32's Wi-Fi hotspot (`ESP32_S3_Audio_Mic`). It automatically connects to the stream when the device wakes up, saves the raw audio into `.wav` format, and clears out archived audio files older than **7 days** to protect your disk space.

### Dependencies Installation
```bash
pip install soundfile numpy
```

### Script Source (`receiver.py`)
```python
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
```
