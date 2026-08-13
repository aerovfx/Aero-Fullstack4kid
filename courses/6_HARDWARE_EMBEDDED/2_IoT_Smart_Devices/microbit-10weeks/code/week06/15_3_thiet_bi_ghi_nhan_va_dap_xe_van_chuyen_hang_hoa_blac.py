"""microbit-10weeks · Tuần 06 · Bài 15.

Chủ đề: 3: Thiết Bị Ghi Nhận Va Đập Xe Vận Chuyển Hàng Hóa (Blackbox Transport Logger)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('15 - 3: Thiết Bị Ghi Nhận Va Đập Xe Vận Chuyển Hàng Hóa (Blackbox Transport Logger):', result)
