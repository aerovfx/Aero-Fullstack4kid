"""cybersecurity-10weeks · Tuần 03 · Bài 15.

Chủ đề: Hiểu về Địa chỉ và Giá trị (Understanding Addresses and Values)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('15 - Hiểu về Địa chỉ và Giá trị (Understanding Addresses and Values):', result)
