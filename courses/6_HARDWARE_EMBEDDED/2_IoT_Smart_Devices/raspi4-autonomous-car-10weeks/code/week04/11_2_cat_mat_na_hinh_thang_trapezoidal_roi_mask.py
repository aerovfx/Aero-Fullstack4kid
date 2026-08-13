"""raspi4-autonomous-car-10weeks · Tuần 04 · Bài 11.

Chủ đề: 2: Cắt Mặt Nạ Hình Thang (Trapezoidal ROI Mask)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - 2: Cắt Mặt Nạ Hình Thang (Trapezoidal ROI Mask):', result)
