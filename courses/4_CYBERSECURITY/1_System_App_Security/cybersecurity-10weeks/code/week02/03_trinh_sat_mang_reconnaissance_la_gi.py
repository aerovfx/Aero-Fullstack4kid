"""cybersecurity-10weeks · Tuần 02 · Bài 03.

Chủ đề: Trinh sát mạng (Reconnaissance) là gì?
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('03 - Trinh sát mạng (Reconnaissance) là gì?:', result)
