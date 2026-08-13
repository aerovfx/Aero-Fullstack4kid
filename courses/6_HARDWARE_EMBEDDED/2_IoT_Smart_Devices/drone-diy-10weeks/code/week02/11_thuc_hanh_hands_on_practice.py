"""drone-diy-10weeks · Tuần 02 · Bài 11.

Chủ đề: Thực Hành / Hands-On Practice
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - Thực Hành / Hands-On Practice:', result)
