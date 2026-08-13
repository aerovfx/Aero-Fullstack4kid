"""software-reverse-engineering-10weeks · Tuần 01 · Bài 19.

Chủ đề: Bộ công cụ cần chuẩn bị
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('19 - Bộ công cụ cần chuẩn bị:', result)
