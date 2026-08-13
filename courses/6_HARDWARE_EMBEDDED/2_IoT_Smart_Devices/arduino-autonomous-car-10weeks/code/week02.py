"""Tuần 2: Motor PWM. Mô phỏng offline, không điều khiển actuator thật."""
from dataclasses import dataclass

@dataclass(frozen=True)
class SensorFrame:
    distance_cm: float
    battery_v: float
    confidence: float = 1.0

def decide(frame: SensorFrame) -> str:
    """Fail-safe: dữ liệu/battery bất thường luôn dừng hệ thống."""
    if frame.battery_v < 0 or frame.distance_cm < 0:
        raise ValueError("Dữ liệu cảm biến không hợp lệ")
    if frame.battery_v < 6.5 or frame.confidence < 0.6:
        return "STOP"
    if frame.distance_cm < 30:
        return "AVOID"
    return "FORWARD"

if __name__ == "__main__":
    assert decide(SensorFrame(100, 7.4)) == "FORWARD"
    assert decide(SensorFrame(20, 7.4)) == "AVOID"
    assert decide(SensorFrame(100, 6.0)) == "STOP"
    print("week02: PASS")
