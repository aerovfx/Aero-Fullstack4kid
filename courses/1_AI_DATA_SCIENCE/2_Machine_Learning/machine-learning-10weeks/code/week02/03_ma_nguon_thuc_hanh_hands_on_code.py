"""machine-learning-10weeks · Tuần 02 · Bài 03.

Chủ đề: Mã nguồn thực hành (Hands-on Code)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('03 - Mã nguồn thực hành (Hands-on Code):', result)
