"""software-reverse-engineering-10weeks · Tuần 04 · Bài 03.

Chủ đề: Call Stack và Quản Lý Khung Gọi Hàm (Call Frames)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('03 - Call Stack và Quản Lý Khung Gọi Hàm (Call Frames):', result)
