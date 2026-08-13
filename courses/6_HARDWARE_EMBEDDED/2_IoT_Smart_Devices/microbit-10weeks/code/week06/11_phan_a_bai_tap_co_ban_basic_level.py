"""microbit-10weeks · Tuần 06 · Bài 11.

Chủ đề: 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - 🟢 Phần A: Bài Tập Cơ Bản (Basic Level):', result)
