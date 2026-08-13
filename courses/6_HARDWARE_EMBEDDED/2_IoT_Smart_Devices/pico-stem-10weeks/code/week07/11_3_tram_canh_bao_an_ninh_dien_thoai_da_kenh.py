"""pico-stem-10weeks · Tuần 07 · Bài 11.

Chủ đề: 3: Trạm Cảnh Báo An Ninh Điện Thoại Đa Kênh
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - 3: Trạm Cảnh Báo An Ninh Điện Thoại Đa Kênh:', result)
