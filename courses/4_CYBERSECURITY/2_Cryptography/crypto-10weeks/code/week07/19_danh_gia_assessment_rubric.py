"""crypto-10weeks · Tuần 07 · Bài 19.

Chủ đề: Đánh Giá / Assessment Rubric
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('19 - Đánh Giá / Assessment Rubric:', result)
