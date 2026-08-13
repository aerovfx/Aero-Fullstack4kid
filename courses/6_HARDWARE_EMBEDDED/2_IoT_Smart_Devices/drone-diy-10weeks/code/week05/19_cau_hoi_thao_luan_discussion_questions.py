"""drone-diy-10weeks · Tuần 05 · Bài 19.

Chủ đề: Câu Hỏi Thảo Luận / Discussion Questions
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('19 - Câu Hỏi Thảo Luận / Discussion Questions:', result)
