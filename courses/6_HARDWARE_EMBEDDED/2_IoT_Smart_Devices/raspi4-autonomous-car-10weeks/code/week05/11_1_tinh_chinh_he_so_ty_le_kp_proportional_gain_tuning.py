"""raspi4-autonomous-car-10weeks · Tuần 05 · Bài 11.

Chủ đề: 1: Tinh Chỉnh Hệ Số Tỷ Lệ $Kp$ (Proportional Gain Tuning)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - 1: Tinh Chỉnh Hệ Số Tỷ Lệ $Kp$ (Proportional Gain Tuning):', result)
