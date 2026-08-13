"""crypto-10weeks · Tuần 08 · Bài 07.

Chủ đề: Các Thuật Toán Băm Mật Khẩu Chuyên Dụng (KDFs)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('07 - Các Thuật Toán Băm Mật Khẩu Chuyên Dụng (KDFs):', result)
