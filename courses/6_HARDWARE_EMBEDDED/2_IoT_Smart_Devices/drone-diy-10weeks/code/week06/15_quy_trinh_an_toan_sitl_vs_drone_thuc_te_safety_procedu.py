"""drone-diy-10weeks · Tuần 06 · Bài 15.

Chủ đề: Quy Trình An Toàn: SITL vs Drone Thực Tế / Safety Procedures: SITL vs Real World
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('15 - Quy Trình An Toàn: SITL vs Drone Thực Tế / Safety Procedures: SITL vs Real World:', result)
