/*
 * Smart Home IoT Gateway - Capstone Baseline Code (ESP32)
 * Aero-Fullstack4kid - Applied IoT & Robotics 10 Weeks
 */

#include <WiFi.h>
#include <PubSubClient.h>
#include <ESP32Servo.h>
#include "DHT.h"

const int DHT_PIN = 15;
const int SERVO_PIN = 13;
const int RELAY_PIN = 23;

DHT dht(DHT_PIN, DHT22);
Servo panServo;
WiFiClient espClient;
PubSubClient mqttClient(espClient);

const char* SSID = "WOKWI-GUEST";
const char* PASSWORD = "";
const char* MQTT_BROKER = "broker.hivemq.com";

void setup() {
    Serial.begin(115200);
    pinMode(RELAY_PIN, OUTPUT);
    dht.begin();
    panServo.attach(SERVO_PIN);
    panServo.write(90);

    WiFi.begin(SSID, PASSWORD);
    while (WiFi.status() != WL_CONNECTED) delay(500);
    mqttClient.setServer(MQTT_BROKER, 1883);
}

void loop() {
    if (!mqttClient.connected()) {
        if (mqttClient.connect("CapStone_ESP32_SmartHome")) {
            mqttClient.subscribe("smarthome/relay");
        }
    }
    mqttClient.loop();

    static unsigned long lastPub = 0;
    if (millis() - lastPub > 3000) {
        lastPub = millis();
        float t = dht.readTemperature();
        char msg[64];
        snprintf(msg, sizeof(msg), "{\"temp\":%.1f}", t);
        mqttClient.publish("smarthome/telemetry", msg);
    }
}
