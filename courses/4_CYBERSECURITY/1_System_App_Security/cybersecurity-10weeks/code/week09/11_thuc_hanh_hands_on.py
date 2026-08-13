"""cybersecurity-10weeks · Tuần 09 · Bài 11.

Chủ đề: Thực Hành / Hands-On
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - Thực Hành / Hands-On:', result)
