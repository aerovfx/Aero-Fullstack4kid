"""pico-stem-10weeks · Tuần 03 · Bài 11.

Chủ đề: 3: Thước Livo Thủy Ngân Điện Tử 2 Trục
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - 3: Thước Livo Thủy Ngân Điện Tử 2 Trục:', result)
