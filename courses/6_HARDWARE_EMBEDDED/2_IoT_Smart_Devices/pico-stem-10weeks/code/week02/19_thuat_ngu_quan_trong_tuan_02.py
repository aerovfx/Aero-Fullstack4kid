"""pico-stem-10weeks · Tuần 02 · Bài 19.

Chủ đề: Thuật ngữ quan trọng tuần 02
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('19 - Thuật ngữ quan trọng tuần 02:', result)
