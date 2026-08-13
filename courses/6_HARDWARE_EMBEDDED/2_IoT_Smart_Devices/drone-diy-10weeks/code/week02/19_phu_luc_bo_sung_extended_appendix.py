"""drone-diy-10weeks · Tuần 02 · Bài 19.

Chủ đề: Phụ lục Bổ Sung / Extended Appendix
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('19 - Phụ lục Bổ Sung / Extended Appendix:', result)
