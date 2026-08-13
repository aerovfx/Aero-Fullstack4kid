"""cybersecurity-10weeks · Tuần 10 · Bài 15.

Chủ đề: Phần 2: Xây dựng tập dữ liệu mô phỏng / Part 2: Building the Synthetic Dataset
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('15 - Phần 2: Xây dựng tập dữ liệu mô phỏng / Part 2: Building the Synthetic Dataset:', result)
