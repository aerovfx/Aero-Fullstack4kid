"""data-science-10weeks · Tuần 03 · Bài 11.

Chủ đề: Câu Hỏi Thảo Luận / Discussion
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - Câu Hỏi Thảo Luận / Discussion:', result)
