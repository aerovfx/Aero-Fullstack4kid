"""pico-stem-10weeks · Tuần 10 · Bài 15.

Chủ đề: Dữ liệu đầu vào tuần 10
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('15 - Dữ liệu đầu vào tuần 10:', result)
