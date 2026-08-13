"""drone-diy-10weeks · Tuần 01 · Bài 15.

Chủ đề: Bước 3: Mini quiz / Step 3: Match components to functions
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('15 - Bước 3: Mini quiz / Step 3: Match components to functions:', result)
