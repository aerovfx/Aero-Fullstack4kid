#!/usr/bin/env python3
"""
============================================================
AUTONOMOUS CAR — Raspberry Pi Main Control Software
Xe Tự Hành — Phần mềm điều khiển chính trên Raspberry Pi

Khoá học DIY Autonomous Car - Tuần 6-10
DIY Autonomous Car Course - Week 6-10

Architecture / Kiến trúc:
  main.py  ←→  Arduino (Serial/JSON)
           ←→  GPS (gpsd/pynmea2)
           ←→  Camera (OpenCV)
           ←→  Web Dashboard (Flask)
============================================================
"""

import math, time, json, threading, logging, csv
import serial
import numpy as np
from dataclasses import dataclass, field
from typing import List, Optional, Tuple
from enum import Enum, auto

logging.basicConfig(level=logging.INFO,
    format='%(asctime)s [%(levelname)s] %(name)s: %(message)s')
log = logging.getLogger('AutonomousCar')

# ═══════════════════════════════════════════════════════════════
# DATA STRUCTURES / CẤU TRÚC DỮ LIỆU
# ═══════════════════════════════════════════════════════════════

@dataclass
class GPSPosition:
    lat: float = 0.0
    lon: float = 0.0
    satellites: int = 0
    hdop: float = 99.0
    speed_mps: float = 0.0
    valid: bool = False

@dataclass
class SensorData:
    dist_front: float = 999.0
    dist_front_left: float = 999.0
    dist_front_right: float = 999.0
    heading: float = 0.0
    estop: bool = False

@dataclass
class Waypoint:
    lat: float
    lon: float
    label: str = ""
    arrival_radius: float = 1.5   # metres

class VehicleState(Enum):
    IDLE        = auto()
    NAVIGATING  = auto()
    AVOIDING    = auto()
    ARRIVED     = auto()
    EMERGENCY   = auto()

# ═══════════════════════════════════════════════════════════════
# GPS UTILITIES / TIỆN ÍCH GPS
# ═══════════════════════════════════════════════════════════════

def haversine(lat1: float, lon1: float, lat2: float, lon2: float) -> float:
    """
    Tính khoảng cách giữa 2 tọa độ GPS (metres)
    Calculate distance between two GPS coordinates (metres)
    """
    R = 6_371_000  # Earth radius in metres
    phi1, phi2 = math.radians(lat1), math.radians(lat2)
    dphi    = math.radians(lat2 - lat1)
    dlambda = math.radians(lon2 - lon1)
    a = math.sin(dphi/2)**2 + math.cos(phi1)*math.cos(phi2)*math.sin(dlambda/2)**2
    return R * 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a))

def bearing(lat1: float, lon1: float, lat2: float, lon2: float) -> float:
    """
    Tính góc phương vị từ điểm 1 đến điểm 2 (degrees, 0=North)
    Calculate bearing from point 1 to point 2 (degrees, 0=North)
    """
    phi1, phi2 = math.radians(lat1), math.radians(lat2)
    dlambda    = math.radians(lon2 - lon1)
    x = math.sin(dlambda) * math.cos(phi2)
    y = math.cos(phi1)*math.sin(phi2) - math.sin(phi1)*math.cos(phi2)*math.cos(dlambda)
    return (math.degrees(math.atan2(x, y)) + 360) % 360

def heading_error(target: float, current: float) -> float:
    """
    Tính lỗi góc trong [-180, +180]
    Compute heading error in [-180, +180]
    """
    err = target - current
    while err >  180: err -= 360
    while err < -180: err += 360
    return err

# ═══════════════════════════════════════════════════════════════
# PID CONTROLLER / BỘ ĐIỀU KHIỂN PID
# ═══════════════════════════════════════════════════════════════

class PIDController:
    def __init__(self, kp: float, ki: float, kd: float,
                 out_min: float = -255, out_max: float = 255):
        self.kp, self.ki, self.kd = kp, ki, kd
        self.out_min, self.out_max = out_min, out_max
        self._integral  = 0.0
        self._prev_error = 0.0
        self._last_time  = time.time()

    def compute(self, error: float) -> float:
        now = time.time()
        dt  = now - self._last_time
        if dt <= 0 or dt > 1.0:
            dt = 0.05
        self._last_time = now

        self._integral += error * dt
        # Anti-windup / Chống tích lũy
        self._integral = np.clip(self._integral,
                                 self.out_min / max(self.ki, 1e-6),
                                 self.out_max / max(self.ki, 1e-6))

        derivative = (error - self._prev_error) / dt
        self._prev_error = error

        output = self.kp*error + self.ki*self._integral + self.kd*derivative
        return float(np.clip(output, self.out_min, self.out_max))

    def reset(self):
        self._integral   = 0.0
        self._prev_error = 0.0

# ═══════════════════════════════════════════════════════════════
# ARDUINO SERIAL BRIDGE / GIAO TIẾP SERIAL VỚI ARDUINO
# ═══════════════════════════════════════════════════════════════

class ArduinoBridge:
    def __init__(self, port: str = '/dev/ttyUSB0', baud: int = 115200):
        self.ser  = serial.Serial(port, baud, timeout=0.1)
        self.lock = threading.Lock()
        self._latest: SensorData = SensorData()
        self._running = True
        threading.Thread(target=self._reader, daemon=True).start()
        time.sleep(2)  # Arduino reset delay
        log.info(f"Arduino connected on {port}")

    def _reader(self):
        """Background thread reading telemetry from Arduino"""
        while self._running:
            try:
                line = self.ser.readline().decode('utf-8', errors='ignore').strip()
                if not line: continue
                data = json.loads(line)
                s = SensorData(
                    dist_front       = data.get('dist_f',  999),
                    dist_front_left  = data.get('dist_fl', 999),
                    dist_front_right = data.get('dist_fr', 999),
                    heading          = data.get('heading', 0),
                    estop            = data.get('estop', False)
                )
                self._latest = s
            except Exception:
                pass

    def get_sensors(self) -> SensorData:
        return self._latest

    def drive(self, left: int, right: int):
        cmd = json.dumps({'left': int(left), 'right': int(right)}) + '\n'
        with self.lock:
            self.ser.write(cmd.encode())

    def stop(self):
        self.drive(0, 0)

    def close(self):
        self._running = False
        self.stop()
        self.ser.close()

# ═══════════════════════════════════════════════════════════════
# GPS READER / ĐỌC GPS
# ═══════════════════════════════════════════════════════════════

class GPSReader:
    def __init__(self, port: str = '/dev/ttyAMA0', baud: int = 9600):
        import pynmea2
        self._pynmea2 = pynmea2
        self.ser = serial.Serial(port, baud, timeout=1)
        self._pos = GPSPosition()
        self._running = True
        threading.Thread(target=self._reader, daemon=True).start()
        log.info(f"GPS reader started on {port}")

    def _reader(self):
        while self._running:
            try:
                line = self.ser.readline().decode('ascii', errors='ignore').strip()
                if not line.startswith('$'): continue
                msg = self._pynmea2.parse(line)
                if hasattr(msg, 'latitude') and msg.latitude:
                    self._pos = GPSPosition(
                        lat        = msg.latitude,
                        lon        = msg.longitude,
                        valid      = True,
                        satellites = int(getattr(msg, 'num_sv', 0) or 0),
                        hdop       = float(getattr(msg, 'horizontal_dil', 99) or 99),
                        speed_mps  = float(getattr(msg, 'spd_over_grnd', 0) or 0) * 0.514
                    )
            except Exception:
                pass

    def get_position(self) -> GPSPosition:
        return self._pos

    def is_reliable(self) -> bool:
        p = self._pos
        return p.valid and p.satellites >= 6 and p.hdop < 2.0

    def close(self):
        self._running = False
        self.ser.close()

# ═══════════════════════════════════════════════════════════════
# OBSTACLE DETECTOR / PHÁT HIỆN VẬT CẢN
# ═══════════════════════════════════════════════════════════════

DANGER_CM  = 20.0
WARNING_CM = 45.0

class ObstacleDetector:
    def assess(self, sensors: SensorData) -> str:
        """
        Đánh giá tình trạng vật cản dựa trên 3 cảm biến
        Assess obstacle status from 3 sensors
        Returns: 'CLEAR', 'SLOW', 'AVOID_LEFT', 'AVOID_RIGHT', 'STOP'
        """
        f, fl, fr = sensors.dist_front, sensors.dist_front_left, sensors.dist_front_right

        if f < DANGER_CM and fl < DANGER_CM and fr < DANGER_CM:
            return 'STOP'                    # Bị kẹt hoàn toàn
        if f < DANGER_CM:
            return 'AVOID_LEFT' if fr > fl else 'AVOID_RIGHT'
        if fl < DANGER_CM:
            return 'AVOID_RIGHT'
        if fr < DANGER_CM:
            return 'AVOID_LEFT'
        if f < WARNING_CM:
            return 'SLOW'
        return 'CLEAR'

# ═══════════════════════════════════════════════════════════════
# MAIN VEHICLE CONTROLLER / BỘ ĐIỀU KHIỂN CHÍNH
# ═══════════════════════════════════════════════════════════════

class AutonomousVehicle:
    BASE_SPEED   = 180  # Normal cruising speed / Tốc độ hành trình
    SLOW_SPEED   = 100  # Reduced speed near obstacles
    AVOID_SPEED  = 140  # Speed during avoidance

    def __init__(self, waypoint_file: str, arduino_port: str = '/dev/ttyUSB0'):
        self.arduino  = ArduinoBridge(arduino_port)
        self.gps      = GPSReader()
        self.detector = ObstacleDetector()
        self.steer_pid = PIDController(kp=2.5, ki=0.008, kd=0.6)

        self.waypoints: List[Waypoint] = self._load_waypoints(waypoint_file)
        self.wp_idx   = 0
        self.state    = VehicleState.IDLE
        self._running = True

        # Telemetry log / Ghi log
        self._log_file = open(f"flight_log_{int(time.time())}.csv", 'w', newline='')
        self._csv = csv.writer(self._log_file)
        self._csv.writerow(['time','state','lat','lon','dist_to_wp','heading',
                            'dist_f','dist_fl','dist_fr','left_cmd','right_cmd'])

    def _load_waypoints(self, path: str) -> List[Waypoint]:
        with open(path) as f:
            data = json.load(f)
        wps = [Waypoint(w['lat'], w['lon'], w.get('label',''), w.get('arrival_radius', 1.5))
               for w in data['waypoints']]
        log.info(f"Loaded {len(wps)} waypoints from {path}")
        return wps

    def run(self):
        log.info("🚗 Starting autonomous mission...")
        self.state = VehicleState.NAVIGATING

        try:
            while self._running:
                sensors = self.arduino.get_sensors()
                gps_pos = self.gps.get_position()

                # Emergency stop / Dừng khẩn cấp
                if sensors.estop:
                    self.state = VehicleState.EMERGENCY
                    self.arduino.stop()
                    log.warning("⛔ E-STOP activated!")
                    time.sleep(0.1)
                    continue

                # Check obstacle / Kiểm tra vật cản
                obstacle_cmd = self.detector.assess(sensors)
                if obstacle_cmd != 'CLEAR' and self.state == VehicleState.NAVIGATING:
                    self.state = VehicleState.AVOIDING

                # ── State machine ─────────────────────────────
                left_cmd = right_cmd = 0

                if self.state == VehicleState.NAVIGATING:
                    if not gps_pos.valid or self.wp_idx >= len(self.waypoints):
                        self.arduino.stop()
                        self.state = VehicleState.ARRIVED
                        continue

                    wp = self.waypoints[self.wp_idx]
                    dist = haversine(gps_pos.lat, gps_pos.lon, wp.lat, wp.lon)

                    if dist < wp.arrival_radius:
                        log.info(f"✅ Reached waypoint {self.wp_idx}: {wp.label}")
                        self.wp_idx += 1
                        self.steer_pid.reset()
                        if self.wp_idx >= len(self.waypoints):
                            self.state = VehicleState.ARRIVED
                        continue

                    target_bearing = bearing(gps_pos.lat, gps_pos.lon, wp.lat, wp.lon)
                    err = heading_error(target_bearing, sensors.heading)
                    steer = self.steer_pid.compute(err)

                    speed = self.SLOW_SPEED if obstacle_cmd == 'SLOW' else self.BASE_SPEED
                    left_cmd  = int(np.clip(speed + steer, -255, 255))
                    right_cmd = int(np.clip(speed - steer, -255, 255))

                elif self.state == VehicleState.AVOIDING:
                    if obstacle_cmd == 'CLEAR':
                        self.state = VehicleState.NAVIGATING
                        self.steer_pid.reset()
                    elif obstacle_cmd == 'AVOID_LEFT':
                        left_cmd, right_cmd = -self.AVOID_SPEED, self.AVOID_SPEED
                    elif obstacle_cmd == 'AVOID_RIGHT':
                        left_cmd, right_cmd = self.AVOID_SPEED, -self.AVOID_SPEED
                    elif obstacle_cmd == 'STOP':
                        left_cmd, right_cmd = 0, 0
                        time.sleep(0.5)

                elif self.state == VehicleState.ARRIVED:
                    self.arduino.stop()
                    log.info("🏁 Mission complete! All waypoints reached.")
                    break

                # Send to Arduino / Gửi lệnh xuống Arduino
                self.arduino.drive(left_cmd, right_cmd)

                # Log telemetry / Ghi log
                self._csv.writerow([
                    time.time(), self.state.name,
                    gps_pos.lat, gps_pos.lon,
                    haversine(gps_pos.lat, gps_pos.lon,
                              self.waypoints[min(self.wp_idx, len(self.waypoints)-1)].lat,
                              self.waypoints[min(self.wp_idx, len(self.waypoints)-1)].lon)
                    if gps_pos.valid else -1,
                    sensors.heading,
                    sensors.dist_front, sensors.dist_front_left, sensors.dist_front_right,
                    left_cmd, right_cmd
                ])

                time.sleep(0.05)  # 20 Hz control loop

        except KeyboardInterrupt:
            log.info("User interrupted")
        finally:
            self.arduino.stop()
            self.arduino.close()
            self._log_file.close()
            log.info("Vehicle shutdown complete.")

# ═══════════════════════════════════════════════════════════════
# ENTRY POINT / ĐIỂM KHỞI CHẠY
# ═══════════════════════════════════════════════════════════════

if __name__ == '__main__':
    import sys
    waypoint_file = sys.argv[1] if len(sys.argv) > 1 else 'mission/waypoints.json'
    arduino_port  = sys.argv[2] if len(sys.argv) > 2 else '/dev/ttyUSB0'

    vehicle = AutonomousVehicle(waypoint_file, arduino_port)
    vehicle.run()
