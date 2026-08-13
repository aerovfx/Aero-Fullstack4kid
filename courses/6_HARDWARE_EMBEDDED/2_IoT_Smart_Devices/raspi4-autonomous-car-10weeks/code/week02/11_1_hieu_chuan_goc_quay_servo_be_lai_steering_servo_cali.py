"""raspi4-autonomous-car-10weeks · Tuần 02 · Bài 11.

Chủ đề: 1: Hiệu Chuẩn Góc Quay Servo Bẻ Lái (Steering Servo Calibration)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - 1: Hiệu Chuẩn Góc Quay Servo Bẻ Lái (Steering Servo Calibration):', result)
