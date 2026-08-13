"""microbit-10weeks · Tuần 08 · Bài 11.

Chủ đề: 1: Lập Trình Các Chuyển Động Khung Xe 2 Bánh
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - 1: Lập Trình Các Chuyển Động Khung Xe 2 Bánh:', result)
