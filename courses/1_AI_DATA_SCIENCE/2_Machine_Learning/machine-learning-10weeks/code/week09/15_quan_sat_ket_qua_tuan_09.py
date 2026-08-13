"""machine-learning-10weeks · Tuần 09 · Bài 15.

Chủ đề: Quan sát kết quả tuần 09
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('15 - Quan sát kết quả tuần 09:', result)
