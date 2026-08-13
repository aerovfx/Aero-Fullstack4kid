"""software-reverse-engineering-10weeks · Tuần 04 · Bài 07.

Chủ đề: Hardware Breakpoint
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('07 - Hardware Breakpoint:', result)
