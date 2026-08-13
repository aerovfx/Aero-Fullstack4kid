"""drone-diy-10weeks · Tuần 03 · Bài 15.

Chủ đề: Bước 2: Connect FC / Step 2: Kết nối mạch FC
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('15 - Bước 2: Connect FC / Step 2: Kết nối mạch FC:', result)
