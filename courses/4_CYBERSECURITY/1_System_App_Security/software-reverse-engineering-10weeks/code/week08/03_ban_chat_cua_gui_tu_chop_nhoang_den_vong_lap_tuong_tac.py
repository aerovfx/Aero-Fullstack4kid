"""software-reverse-engineering-10weeks · Tuần 08 · Bài 03.

Chủ đề: Bản chất của GUI: Từ "Chớp nhoáng" đến "Vòng lặp tương tác"
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('03 - Bản chất của GUI: Từ "Chớp nhoáng" đến "Vòng lặp tương tác":', result)
