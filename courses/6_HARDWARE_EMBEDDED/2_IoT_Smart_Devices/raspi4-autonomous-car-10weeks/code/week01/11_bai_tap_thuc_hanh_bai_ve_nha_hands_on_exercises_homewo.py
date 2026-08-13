"""raspi4-autonomous-car-10weeks · Tuần 01 · Bài 11.

Chủ đề: Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework:', result)
