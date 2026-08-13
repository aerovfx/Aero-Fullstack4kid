"""software-reverse-engineering-10weeks · Tuần 07 · Bài 07.

Chủ đề: Cấu Trúc Một Báo Cáo Bảo Mật Chuẩn (Security Finding Report)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('07 - Cấu Trúc Một Báo Cáo Bảo Mật Chuẩn (Security Finding Report):', result)
