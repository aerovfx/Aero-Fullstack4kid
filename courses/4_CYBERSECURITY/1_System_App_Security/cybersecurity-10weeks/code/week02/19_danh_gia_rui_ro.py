"""cybersecurity-10weeks · Tuần 02 · Bài 19.

Chủ đề: Đánh giá rủi ro
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('19 - Đánh giá rủi ro:', result)
