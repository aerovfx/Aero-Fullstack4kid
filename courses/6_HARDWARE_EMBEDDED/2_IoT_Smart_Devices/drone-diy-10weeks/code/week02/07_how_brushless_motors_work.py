"""drone-diy-10weeks · Tuần 02 · Bài 07.

Chủ đề: How brushless motors work
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('07 - How brushless motors work:', result)
