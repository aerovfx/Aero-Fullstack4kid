"""crypto-10weeks · Tuần 05 · Bài 07.

Chủ đề: Nguyên Lý An Toàn & Lỗi Textbook RSA
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('07 - Nguyên Lý An Toàn & Lỗi Textbook RSA:', result)
