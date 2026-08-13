"""crypto-10weeks · Tuần 04 · Bài 15.

Chủ đề: 2: Xây Dựng Module Chữ Ký HMAC API
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('15 - 2: Xây Dựng Module Chữ Ký HMAC API:', result)
