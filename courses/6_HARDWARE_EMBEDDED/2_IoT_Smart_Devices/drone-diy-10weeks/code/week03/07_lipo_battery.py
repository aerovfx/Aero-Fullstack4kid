"""drone-diy-10weeks · Tuần 03 · Bài 07.

Chủ đề: LiPo battery
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('07 - LiPo battery:', result)
