"""drone-diy-10weeks · Tuần 05 · Bài 15.

Chủ đề: Bước 1: Full assembly of drone / Step 1: Lắp ráp cuối cùng
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('15 - Bước 1: Full assembly of drone / Step 1: Lắp ráp cuối cùng:', result)
