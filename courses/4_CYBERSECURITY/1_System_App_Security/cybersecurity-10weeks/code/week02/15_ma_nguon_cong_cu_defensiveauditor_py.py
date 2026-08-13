"""cybersecurity-10weeks · Tuần 02 · Bài 15.

Chủ đề: Mã Nguồn Công Cụ: defensiveauditor.py
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('15 - Mã Nguồn Công Cụ: defensiveauditor.py:', result)
