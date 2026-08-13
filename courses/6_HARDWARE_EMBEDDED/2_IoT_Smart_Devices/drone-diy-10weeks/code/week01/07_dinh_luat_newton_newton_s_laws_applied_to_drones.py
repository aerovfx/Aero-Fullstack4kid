"""drone-diy-10weeks · Tuần 01 · Bài 07.

Chủ đề: Định luật Newton / Newton's laws applied to drones
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print("07 - Định luật Newton / Newton's laws applied to drones:", result)
