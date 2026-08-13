"""software-reverse-engineering-10weeks · Tuần 04 · Bài 19.

Chủ đề: A.2 Mở chương trình trong x64dbg
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('19 - A.2 Mở chương trình trong x64dbg:', result)
