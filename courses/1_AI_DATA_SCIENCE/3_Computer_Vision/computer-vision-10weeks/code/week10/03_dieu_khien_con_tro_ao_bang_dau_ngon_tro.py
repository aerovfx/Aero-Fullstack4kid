"""computer-vision-10weeks · Tuần 10 · Bài 03.

Chủ đề: Điều khiển con trỏ ảo bằng đầu ngón trỏ
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('03 - Điều khiển con trỏ ảo bằng đầu ngón trỏ:', result)
