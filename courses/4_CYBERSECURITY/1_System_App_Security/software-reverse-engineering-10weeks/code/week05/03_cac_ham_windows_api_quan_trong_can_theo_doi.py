"""software-reverse-engineering-10weeks · Tuần 05 · Bài 03.

Chủ đề: Các hàm Windows API quan trọng cần theo dõi
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('03 - Các hàm Windows API quan trọng cần theo dõi:', result)
