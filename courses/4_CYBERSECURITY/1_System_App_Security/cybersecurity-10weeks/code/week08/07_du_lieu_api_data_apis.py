"""cybersecurity-10weeks · Tuần 08 · Bài 07.

Chủ đề: Dữ Liệu & API / Data & APIs
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('07 - Dữ Liệu & API / Data & APIs:', result)
