"""crypto-10weeks · Tuần 09 · Bài 15.

Chủ đề: 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('15 - 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level):', result)
