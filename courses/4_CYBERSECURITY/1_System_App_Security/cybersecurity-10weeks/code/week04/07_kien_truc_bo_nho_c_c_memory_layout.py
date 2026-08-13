"""cybersecurity-10weeks · Tuần 04 · Bài 07.

Chủ đề: Kiến trúc bộ nhớ C++ (C++ Memory Layout)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('07 - Kiến trúc bộ nhớ C++ (C++ Memory Layout):', result)
