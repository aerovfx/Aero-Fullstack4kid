"""crypto-10weeks · Tuần 07 · Bài 07.

Chủ đề: Hạ Tầng Khóa Công Khai PKI & Chứng Chỉ X.509
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('07 - Hạ Tầng Khóa Công Khai PKI & Chứng Chỉ X.509:', result)
