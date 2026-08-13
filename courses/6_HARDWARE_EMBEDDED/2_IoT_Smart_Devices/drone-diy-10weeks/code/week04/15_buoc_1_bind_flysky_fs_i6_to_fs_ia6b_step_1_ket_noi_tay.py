"""drone-diy-10weeks · Tuần 04 · Bài 15.

Chủ đề: Bước 1: Bind FlySky FS-i6 to FS-iA6B / Step 1: Kết nối tay cầm và RX
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('15 - Bước 1: Bind FlySky FS-i6 to FS-iA6B / Step 1: Kết nối tay cầm và RX:', result)
