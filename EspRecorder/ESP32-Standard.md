# 💾 Legacy Build Guide: Standard Non-S3 ESP32 (30-Pin WROOM-32)

This page details the implementation for the original legacy **Standard ESP32** variant using the classic `driver/i2s.h` configurations. These instructions are optimized specifically for the common **30-pin ESP-WROOM-32 NodeMCU development board**.

> ⚠️ **Compiler Warning:** This legacy sketch requires `ESP32` board core library version **2.x.x** within the Arduino IDE boards manager. Version 3.x.x and above removes these legacy driver configurations entirely.

---

## 🧮 Hardware Wiring Matrix (30-Pin Layout)

Because 30-pin ESP32 boards have a reduced pinout compared to 38-pin variants, the following pins have been carefully selected to avoid conflicts with strapping pins or internal flash memory.

### 1. INMP441 Microphone to 30-Pin ESP32
*   **VDD** ➡️ ESP32 **3V3** (Pin 1, top-left)
*   **GND** ➡️ ESP32 **GND**
*   **SD (Serial Data)** ➡️ ESP32 **GPIO 32**
*   **SCK (Serial Clock)** ➡️ ESP32 **GPIO 14**
*   **WS (Word Select)** ➡️ ESP32 **GPIO 15**
*   **L/R (Left/Right)** ➡️ Bridge to the mic's own **GND** pin (sets mono channel mode)

### 2. Sensor & Debugging LEDs
*   **Wakeup Sensor Digital Out (DO)** ➡️ ESP32 **GPIO 12** *(Note: Shifted to GPIO 12 on the 30-pin layout to support stable RTC wakeup capabilities).*
*   **Blue LED Anode (+)** ➡️ 220Ω Resistor ➡️ ESP32 **GPIO 26** (Cathode to GND)
*   **Red LED Anode (+)** ➡️ 220Ω Resistor ➡️ ESP32 **GPIO 27** (Cathode to GND)

### 3. Battery Voltage Divider Telemetry
On the 30-pin layout, we route battery sensing to **GPIO 34**, which links to the hardware-stable **ADC1_CH6** to ensure clean analog readings alongside live Wi-Fi activity.
```text
    Battery (+) ───[ 100kΩ Resistor ]───┬───► ESP32 GPIO 34 (ADC1_CH6)
                                        │
                                  [ 100kΩ Resistor ]
                                        │
    Battery (-) ────────────────────────┴───► ESP32 GND
```

---

## 💻 Source Code (`ESP32_Standard_Firmware.ino`)

```cpp
#include <WiFi.h>
#include <driver/i2s.h>

const char* ap_ssid     = "ESP32_Audio_Mic";
const char* ap_password = "SecurePassword123";
WiFiServer server(8080);

// I2S Interface Pins
#define I2S_SD  32
#define I2S_SCK 14
#define I2S_WS  15

// 30-Pin Optimized Control Pins
#define WAKEUP_PIN GPIO_NUM_12       
#define BLUE_LED   26       
#define RED_LED    27       
#define BATTERY_PIN 34          

#define ADC_MAX_MV 3300        
#define ADC_RESOLUTION 4095.0  
#define ACTIVE_RUN_TIME_MS 120000   
#define BUFFER_SIZE 512

char audio_buffer[BUFFER_SIZE];
unsigned long active_start_time = 0;
unsigned long last_battery_check = 0;

void init_i2s_legacy() {
    i2s_config_t i2s_config = {
        .mode = (i2s_mode_t)(I2S_MODE_MASTER | I2S_MODE_RX), 
        .sample_rate = 16000,
        .bits_per_sample = I2S_BITS_PER_SAMPLE_16BIT,
        .channel_format = I2S_CHANNEL_FMT_ONLY_LEFT, 
        .communication_format = I2S_COMM_FORMAT_STAND_I2S,
        .intr_alloc_flags = ESP_INTR_FLAG_LEVEL1,
        .dma_buf_count = 8,
        .dma_buf_len = 64,
        .use_apll = false
    };

    i2s_pin_config_t pin_config = {
        .bck_io_num = I2S_SCK,
        .ws_io_num = I2S_WS,
        .data_out_num = I2S_PIN_NO_CHANGE,
        .data_in_num = I2S_SD
    };

    i2s_driver_install(I2S_NUM_0, &i2s_config, 0, NULL);
    i2s_set_pin(I2S_NUM_0, &pin_config);
    i2s_start(I2S_NUM_0);
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
    i2s_driver_uninstall(I2S_NUM_0);
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
    init_i2s_legacy();
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
            i2s_read(I2S_NUM_0, &audio_buffer, BUFFER_SIZE, &bytes_read, portMAX_DELAY);
            if (bytes_read > 0) {
                client.write((const uint8_t*)audio_buffer, bytes_read);
            }
        }
    }
}
```
