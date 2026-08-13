"""drone-diy-10weeks · Tuần 02 · Bài 15.

Chủ đề: Code / Formulas
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('15 - Code / Formulas:', result)
