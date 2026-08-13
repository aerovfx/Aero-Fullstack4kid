"""pico-stem-10weeks · Tuần 09 · Bài 11.

Chủ đề: 3: Hiệu Ứng Neopixel Cầu Vồng Dùng PIO
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - 3: Hiệu Ứng Neopixel Cầu Vồng Dùng PIO:', result)
