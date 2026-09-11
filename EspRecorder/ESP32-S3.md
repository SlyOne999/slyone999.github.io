# 🚀 Modern Build Guide: ESP32-S3 Variant

This page details the assembly and implementation for the **ESP32-S3** variant using modern standard I2S drivers.

## 🧮 Hardware Wiring Matrix

### 1. INMP441 Microphone to ESP32-S3
*   **VDD** ➡️ ESP32-S3 **3.3V**
*   **GND** ➡️ ESP32-S3 **GND**
*   **SD (Serial Data)** ➡️ ESP32-S3 **GPIO 4**
*   **SCK (Serial Clock)** ➡️ ESP32-S3 **GPIO 5**
*   **WS (Word Select)** ➡️ ESP32-S3 **GPIO 6**
*   **L/R (Left/Right)** ➡️ Bridge to the mic's own **GND** pin (sets mono channel)

### 2. Sensor & Debugging LEDs
*   **Wakeup Sensor Digital Out (DO)** ➡️ ESP32-S3 **GPIO 2**
*   **Blue LED Anode (+)** ➡️ 220Ω Resistor ➡️ ESP32-S3 **GPIO 10** (Cathode to GND)
*   **Red LED Anode (+)** ➡️ 220Ω Resistor ➡️ ESP32-S3 **GPIO 11** (Cathode to GND)

### 3. Battery Voltage Divider Telemetry
```text
    Battery (+) ───[ 100kΩ Resistor ]───┬───► ESP32-S3 GPIO 1 (ADC1_CH0)
                                        │
                                  [ 100kΩ Resistor ]
                                        │
    Battery (-) ────────────────────────┴───► ESP32-S3 GND
```

---

## 🔋 Power Loop Infrastructure
1. Connect Battery **Positive (+)** to the middle pin of your SPDT slide switch.
2. Connect Switch Pin 1 to the **B+** pad on the TP4056 module.
3. Connect Battery **Negative (-)** to the **B-** pad on the TP4056 module.
4. Solder TP4056 **OUT+** to the ESP32-S3 **5V / VIN** pin.
5. Solder TP4056 **OUT-** to the ESP32-S3 **GND** pin.

---

## 💻 Source Code (`ESP32_S3_Firmware.ino`)

```cpp
#include <WiFi.h>
#include <driver/i2s_std.h>

const char* ap_ssid     = "ESP32_S3_Audio_Mic";
const char* ap_password = "SecurePassword123";
WiFiServer server(8080);

#define I2S_SD  GPIO_NUM_4
#define I2S_SCK GPIO_NUM_5
#define I2S_WS  GPIO_NUM_6

#define WAKEUP_PIN GPIO_NUM_2       
#define BLUE_LED   GPIO_NUM_10       
#define RED_LED    GPIO_NUM_11       
#define BATTERY_PIN 1          

#define ADC_MAX_MV 3300        
#define ADC_RESOLUTION 4095.0  
#define ACTIVE_RUN_TIME_MS 120000   
#define BUFFER_SIZE 512

i2s_chan_handle_t rx_handle;
uint8_t audio_buffer[BUFFER_SIZE];
unsigned long active_start_time = 0;
unsigned long last_battery_check = 0;

void init_i2s() {
    i2s_chan_config_t chan_cfg = I2S_CHAN_DEFAULT_CONFIG(I2S_NUM_0, I2S_ROLE_MASTER);
    i2s_new_channel(&chan_cfg, NULL, &rx_handle);
    i2s_std_config_t std_cfg = {
        .clk_cfg = I2S_STD_CLK_DEFAULT_CONFIG(16000),
        .slot_cfg = I2S_STD_MSB_SLOT_DEFAULT_CONFIG(I2S_DATA_BIT_WIDTH_16BIT, I2S_SLOT_MODE_MONO),
        .gpio_cfg = { .mclk = I2S_GPIO_UNUSED, .bclk = I2S_SCK, .ws = I2S_WS, .dout = I2S_GPIO_UNUSED, .din = I2S_SD }
    };
    i2s_channel_init_rx_mode(rx_handle, &std_cfg);
    i2s_channel_enable(rx_handle);
}

void check_battery() {
    uint32_t raw_adc = analogRead(BATTERY_PIN);
    float battery_voltage = (raw_adc * (ADC_MAX_MV / ADC_RESOLUTION) * 2.0) / 1000.0;
    Serial.print("Battery: "); Serial.print(battery_voltage, 2); Serial.println("V");
}

void enter_deep_sleep() {
    digitalWrite(BLUE_LED, LOW);
    for (int i = 0; i < 3; i++) {
        digitalWrite(RED_LED, HIGH); delay(100);
        digitalWrite(RED_LED, LOW);  delay(100);
    }
    i2s_channel_disable(rx_handle);
    WiFi.softAPdisconnect(true);
    esp_sleep_enable_ext0_wakeup(WAKEUP_PIN, 1);
    esp_deep_sleep_start();
}

void setup() {
    Serial.begin(115200);
    active_start_time = millis();
    pinMode(BLUE_LED, OUTPUT);
    pinMode(RED_LED, OUTPUT);
    pinMode(BATTERY_PIN, INPUT);
    
    digitalWrite(BLUE_LED, HIGH);
    WiFi.mode(WIFI_AP);
    WiFi.softAP(ap_ssid, ap_password);
    init_i2s();
    server.begin();
}

void loop() {
    if (millis() - active_start_time > ACTIVE_RUN_TIME_MS) enter_deep_sleep();
    if (millis() - last_battery_check > 5000) {
        check_battery();
        last_battery_check = millis();
    }

    WiFiClient client = server.available();
    if (client) {
        while (client.connected()) {
            if (millis() - active_start_time > ACTIVE_RUN_TIME_MS) {
                client.stop();
                enter_deep_sleep();
            }
            size_t bytes_read = 0;
            esp_err_t result = i2s_channel_read(rx_handle, audio_buffer, BUFFER_SIZE, &bytes_read, portMAX_DELAY);
            if (result == ESP_OK && bytes_read > 0) {
                client.write(audio_buffer, bytes_read);
            }
        }
    }
}
```

## 📦 Enclosure Encasement Tips
*   Mount the board inside a plastic enclosure. **Do not use metal**, as it completely blocks the Wi-Fi signal.
*   Drill a 1.5mm opening in the plastic directly in front of the acoustic port hole on the INMP441 chip.
*   Keep power wires away from the S3's printed PCB antenna layout to prevent RF signal degradation.
