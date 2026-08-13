"""microbit-10weeks · Tuần 04 · Bài 11.

Chủ đề: 1: Đèn Báo Tín Hiệu Giao Thông RGB Neopixel
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - 1: Đèn Báo Tín Hiệu Giao Thông RGB Neopixel:', result)
