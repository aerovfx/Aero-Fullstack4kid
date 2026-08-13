"""software-reverse-engineering-10weeks · Tuần 09 · Bài 11.

Chủ đề: Lab Debug vs Hardened
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - Lab Debug vs Hardened:', result)
