"""drone-diy-10weeks · Tuần 09 · Bài 11.

Chủ đề: Phần 2: Web Dashboard Client (templates/index.html)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - Phần 2: Web Dashboard Client (templates/index.html):', result)
