"""pico-stem-10weeks · Tuần 07 · Bài 07.

Chủ đề: 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('07 - 🟢 Phần A: Bài Tập Cơ Bản (Basic Level):', result)
