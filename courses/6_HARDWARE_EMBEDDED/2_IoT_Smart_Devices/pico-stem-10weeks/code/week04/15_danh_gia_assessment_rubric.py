"""pico-stem-10weeks · Tuần 04 · Bài 15.

Chủ đề: Đánh Giá / Assessment Rubric
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('15 - Đánh Giá / Assessment Rubric:', result)
