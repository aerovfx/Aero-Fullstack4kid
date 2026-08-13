"""software-reverse-engineering-10weeks · Tuần 02 · Bài 03.

Chủ đề: Ứng dụng thực tế
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('03 - Ứng dụng thực tế:', result)
