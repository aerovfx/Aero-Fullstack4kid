"""pico-stem-10weeks · Tuần 01 · Bài 15.

Chủ đề: 3: Đèn LED Đuổi Nhạc 4 Cổng (4-Channel Knight Rider LED Chaser)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('15 - 3: Đèn LED Đuổi Nhạc 4 Cổng (4-Channel Knight Rider LED Chaser):', result)
