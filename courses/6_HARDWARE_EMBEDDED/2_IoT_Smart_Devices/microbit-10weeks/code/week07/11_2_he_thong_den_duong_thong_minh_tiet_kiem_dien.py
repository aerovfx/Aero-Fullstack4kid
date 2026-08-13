"""microbit-10weeks · Tuần 07 · Bài 11.

Chủ đề: 2: Hệ Thống Đèn Đường Thông Minh Tiết Kiệm Điện
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - 2: Hệ Thống Đèn Đường Thông Minh Tiết Kiệm Điện:', result)
