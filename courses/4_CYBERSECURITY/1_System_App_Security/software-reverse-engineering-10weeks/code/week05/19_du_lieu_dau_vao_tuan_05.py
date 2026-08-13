"""software-reverse-engineering-10weeks · Tuần 05 · Bài 19.

Chủ đề: Dữ liệu đầu vào tuần 05
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('19 - Dữ liệu đầu vào tuần 05:', result)
