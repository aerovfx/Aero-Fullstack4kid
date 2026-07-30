/*
 * ============================================================
 * AUTONOMOUS CAR — Arduino Mega Master Firmware
 * Xe Tự Hành — Firmware Arduino Mega Chính
 * 
 * Khoá học DIY Autonomous Car - Tuần 2-5
 * DIY Autonomous Car Course - Week 2-5
 * 
 * Giao tiếp / Communication: JSON over Serial (115200 baud)
 * Command: {"left": 200, "right": 200}
 * Telemetry: {"dist_f":45.2,"dist_fl":80.1,"dist_fr":60.3,
 *              "heading":92.5,"speed_l":200,"speed_r":200}
 * ============================================================
 */

#include <Wire.h>
#include <TinyGPS++.h>
#include <SoftwareSerial.h>
#include <Servo.h>
#include <MPU6050.h>
#include <ArduinoJson.h>

// ── PIN DEFINITIONS ───────────────────────────────────────────
// Motor Left / Motor Trái
#define IN1 22
#define IN2 23
#define ENA 2   // PWM

// Motor Right / Motor Phải
#define IN3 24
#define IN4 25
#define ENB 3   // PWM

// Ultrasonic Sensors / Cảm biến siêu âm
#define TRIG_F  30  // Front trigger
#define ECHO_F  31  // Front echo
#define TRIG_FL 32  // Front-Left trigger
#define ECHO_FL 33  // Front-Left echo
#define TRIG_FR 34  // Front-Right trigger
#define ECHO_FR 35  // Front-Right echo

// Servo Scanner
#define SERVO_PIN 6

// GPS - Hardware Serial1 trên Mega (pins 18,19)
// GPS uses Serial1 on Arduino Mega

// IMU - I2C (SDA=20, SCL=21 on Mega)

// Emergency Stop
#define ESTOP_PIN 44  // Active LOW (NC button)

// ── OBJECTS ──────────────────────────────────────────────────
Servo scanServo;
TinyGPSPlus gps;
MPU6050 mpu;

// ── GLOBAL STATE ─────────────────────────────────────────────
float heading = 0.0;
float distFront = 999, distFrontLeft = 999, distFrontRight = 999;
bool eStop = false;

// PID State / Trạng thái PID
float pidIntegral = 0;
float pidPrevError = 0;
unsigned long pidLastTime = 0;

// PID Gains - tune these! / Hệ số PID - cần chỉnh!
const float KP = 2.5;
const float KI = 0.01;
const float KD = 0.8;

// ── SETUP ─────────────────────────────────────────────────────
void setup() {
  Serial.begin(115200);    // Raspberry Pi
  Serial1.begin(9600);     // GPS module

  // Motor pins
  pinMode(IN1, OUTPUT); pinMode(IN2, OUTPUT); pinMode(ENA, OUTPUT);
  pinMode(IN3, OUTPUT); pinMode(IN4, OUTPUT); pinMode(ENB, OUTPUT);

  // Ultrasonic pins
  pinMode(TRIG_F, OUTPUT); pinMode(ECHO_F, INPUT);
  pinMode(TRIG_FL, OUTPUT); pinMode(ECHO_FL, INPUT);
  pinMode(TRIG_FR, OUTPUT); pinMode(ECHO_FR, INPUT);

  // E-Stop
  pinMode(ESTOP_PIN, INPUT_PULLUP);

  // Servo
  scanServo.attach(SERVO_PIN);
  scanServo.write(90);  // Center

  // IMU
  Wire.begin();
  mpu.initialize();
  if (!mpu.testConnection()) {
    Serial.println("{\"error\":\"MPU6050 not found\"}");
  }

  stopMotors();
  Serial.println("{\"status\":\"Arduino ready\"}");
}

// ── MAIN LOOP ─────────────────────────────────────────────────
void loop() {
  // Check E-Stop first! / Kiểm tra dừng khẩn cấp trước!
  eStop = (digitalRead(ESTOP_PIN) == LOW);
  if (eStop) {
    stopMotors();
  }

  // Read sensors / Đọc cảm biến
  distFront      = measureDistance(TRIG_F, ECHO_F);
  distFrontLeft  = measureDistance(TRIG_FL, ECHO_FL);
  distFrontRight = measureDistance(TRIG_FR, ECHO_FR);
  heading        = readHeading();

  // Read GPS / Đọc GPS
  while (Serial1.available()) gps.encode(Serial1.read());

  // Read command from Pi / Nhận lệnh từ Raspberry Pi
  if (Serial.available()) {
    String cmd = Serial.readStringUntil('\n');
    processCommand(cmd);
  }

  // Send telemetry to Pi / Gửi telemetry lên Pi
  sendTelemetry();

  delay(50);  // 20Hz loop
}

// ── MOTOR CONTROL ─────────────────────────────────────────────
// speed: -255 (backward) to +255 (forward)
void motorLeft(int speed) {
  speed = constrain(speed, -255, 255);
  if (speed >= 0) { digitalWrite(IN1, HIGH); digitalWrite(IN2, LOW); }
  else            { digitalWrite(IN1, LOW);  digitalWrite(IN2, HIGH); speed = -speed; }
  analogWrite(ENA, speed);
}

void motorRight(int speed) {
  speed = constrain(speed, -255, 255);
  if (speed >= 0) { digitalWrite(IN3, HIGH); digitalWrite(IN4, LOW); }
  else            { digitalWrite(IN3, LOW);  digitalWrite(IN4, HIGH); speed = -speed; }
  analogWrite(ENB, speed);
}

void setMotors(int leftSpeed, int rightSpeed) {
  if (eStop) return;  // Safety: ignore commands if e-stop
  motorLeft(leftSpeed);
  motorRight(rightSpeed);
}

void stopMotors() {
  motorLeft(0);
  motorRight(0);
}

// ── ULTRASONIC SENSING ────────────────────────────────────────
float measureDistance(int trigPin, int echoPin) {
  // Rolling average filter / Bộ lọc trung bình
  const int SAMPLES = 3;
  float total = 0;
  for (int i = 0; i < SAMPLES; i++) {
    digitalWrite(trigPin, LOW);   delayMicroseconds(2);
    digitalWrite(trigPin, HIGH);  delayMicroseconds(10);
    digitalWrite(trigPin, LOW);
    long duration = pulseIn(echoPin, HIGH, 30000);  // 30ms timeout = ~5m
    float dist = duration == 0 ? 999 : duration * 0.034 / 2.0;
    total += dist;
    delay(5);
  }
  return total / SAMPLES;
}

// ── IMU HEADING ───────────────────────────────────────────────
float readHeading() {
  int16_t gx, gy, gz, ax, ay, az;
  mpu.getMotion6(&ax, &ay, &az, &gx, &gy, &gz);

  // Gyro Z angular velocity in deg/s
  float gyroZ = gz / 131.0;  // Scale factor for ±250°/s

  // Complementary filter: 98% gyro, 2% (future compass)
  unsigned long now = millis();
  float dt = (now - pidLastTime) / 1000.0;
  pidLastTime = now;

  heading += gyroZ * dt;
  // Keep heading in 0-360
  while (heading < 0)   heading += 360;
  while (heading >= 360) heading -= 360;

  return heading;
}

// ── PID CONTROLLER ────────────────────────────────────────────
float computePID(float error) {
  unsigned long now = millis();
  float dt = (now - pidLastTime) / 1000.0;
  if (dt <= 0 || dt > 1.0) dt = 0.05;

  pidIntegral += error * dt;
  pidIntegral = constrain(pidIntegral, -50, 50);  // Anti-windup

  float derivative = (error - pidPrevError) / dt;
  pidPrevError = error;

  float output = KP * error + KI * pidIntegral + KD * derivative;
  return constrain(output, -255, 255);
}

// ── COMMAND PROCESSING ────────────────────────────────────────
void processCommand(String jsonStr) {
  StaticJsonDocument<200> doc;
  DeserializationError err = deserializeJson(doc, jsonStr);
  if (err) return;

  if (doc.containsKey("left") && doc.containsKey("right")) {
    int leftSpeed  = doc["left"];
    int rightSpeed = doc["right"];
    setMotors(leftSpeed, rightSpeed);
  }

  if (doc.containsKey("stop") && doc["stop"].as<bool>()) {
    stopMotors();
  }

  if (doc.containsKey("servo")) {
    int angle = constrain(doc["servo"].as<int>(), 0, 180);
    scanServo.write(angle);
  }
}

// ── TELEMETRY OUTPUT ──────────────────────────────────────────
void sendTelemetry() {
  StaticJsonDocument<400> doc;
  doc["dist_f"]   = distFront;
  doc["dist_fl"]  = distFrontLeft;
  doc["dist_fr"]  = distFrontRight;
  doc["heading"]  = heading;
  doc["estop"]    = eStop;

  if (gps.location.isValid()) {
    doc["lat"]  = gps.location.lat();
    doc["lng"]  = gps.location.lng();
    doc["sats"] = gps.satellites.value();
    doc["hdop"] = gps.hdop.value() / 100.0;
    doc["spd"]  = gps.speed.mps();
  }

  serializeJson(doc, Serial);
  Serial.println();
}
