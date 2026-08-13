"""computer-vision-10weeks · Tuần 03 · Bài 03.

Chủ đề: So sánh Sobel theo hai hướng
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('03 - So sánh Sobel theo hai hướng:', result)
