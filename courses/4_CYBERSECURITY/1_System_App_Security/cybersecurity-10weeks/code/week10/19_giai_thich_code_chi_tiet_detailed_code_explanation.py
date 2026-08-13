"""cybersecurity-10weeks · Tuần 10 · Bài 19.

Chủ đề: Giải thích Code chi tiết / Detailed Code Explanation
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('19 - Giải thích Code chi tiết / Detailed Code Explanation:', result)
