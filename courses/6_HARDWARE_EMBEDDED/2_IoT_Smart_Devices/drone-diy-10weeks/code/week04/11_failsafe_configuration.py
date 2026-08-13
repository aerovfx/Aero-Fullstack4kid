"""drone-diy-10weeks · Tuần 04 · Bài 11.

Chủ đề: Failsafe configuration
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - Failsafe configuration:', result)
