"""software-reverse-engineering-10weeks · Tuần 03 · Bài 19.

Chủ đề: Thanh ghi cờ EFLAGS — Trung tâm điều phối nhánh
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('19 - Thanh ghi cờ EFLAGS — Trung tâm điều phối nhánh:', result)
