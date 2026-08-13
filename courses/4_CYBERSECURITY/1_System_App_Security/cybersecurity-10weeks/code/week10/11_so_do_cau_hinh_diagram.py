"""cybersecurity-10weeks · Tuần 10 · Bài 11.

Chủ đề: Sơ Đồ Cấu Hình / Diagram
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - Sơ Đồ Cấu Hình / Diagram:', result)
