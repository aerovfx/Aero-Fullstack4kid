"""microbit-10weeks · Tuần 07 · Bài 15.

Chủ đề: 4: Giả Lập Mô Hình Nông Nghiệp Thông Minh Trên MakeCode
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('15 - 4: Giả Lập Mô Hình Nông Nghiệp Thông Minh Trên MakeCode:', result)
