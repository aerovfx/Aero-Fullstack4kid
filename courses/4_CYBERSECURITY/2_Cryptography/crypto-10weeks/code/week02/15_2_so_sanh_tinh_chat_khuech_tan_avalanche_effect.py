"""crypto-10weeks · Tuần 02 · Bài 15.

Chủ đề: 2: So Sánh Tính Chất Khuếch Tán (Avalanche Effect)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('15 - 2: So Sánh Tính Chất Khuếch Tán (Avalanche Effect):', result)
