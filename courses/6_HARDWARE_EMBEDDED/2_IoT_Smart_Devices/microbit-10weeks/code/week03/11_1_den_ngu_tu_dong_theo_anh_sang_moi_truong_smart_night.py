"""microbit-10weeks · Tuần 03 · Bài 11.

Chủ đề: 1: Đèn Ngủ Tự Động Theo Ánh Sáng Môi Trường (Smart Night Light)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - 1: Đèn Ngủ Tự Động Theo Ánh Sáng Môi Trường (Smart Night Light):', result)
