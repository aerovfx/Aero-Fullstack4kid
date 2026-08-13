"""cybersecurity-10weeks · Tuần 07 · Bài 11.

Chủ đề: Hệ Thống Quản Lý Mật Khẩu (Password Management System Flow)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - Hệ Thống Quản Lý Mật Khẩu (Password Management System Flow):', result)
