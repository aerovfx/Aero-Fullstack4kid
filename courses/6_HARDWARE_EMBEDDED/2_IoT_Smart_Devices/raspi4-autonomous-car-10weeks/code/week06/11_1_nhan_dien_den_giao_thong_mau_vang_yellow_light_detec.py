"""raspi4-autonomous-car-10weeks · Tuần 06 · Bài 11.

Chủ đề: 1: Nhận Diện Đèn Giao Thông Màu Vàng (Yellow Light Detection)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - 1: Nhận Diện Đèn Giao Thông Màu Vàng (Yellow Light Detection):', result)
