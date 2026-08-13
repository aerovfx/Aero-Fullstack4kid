"""drone-diy-10weeks · Tuần 10 · Bài 15.

Chủ đề: Track C - Delivery Sim (GPS Navigation)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('15 - Track C - Delivery Sim (GPS Navigation):', result)
