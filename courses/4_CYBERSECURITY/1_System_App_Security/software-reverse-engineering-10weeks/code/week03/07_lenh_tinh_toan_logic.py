"""software-reverse-engineering-10weeks · Tuần 03 · Bài 07.

Chủ đề: Lệnh tính toán & Logic
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('07 - Lệnh tính toán & Logic:', result)
