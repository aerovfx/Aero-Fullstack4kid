"""software-reverse-engineering-10weeks · Tuần 07 · Bài 19.

Chủ đề: Chuẩn bị môi trường tuần 07
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('19 - Chuẩn bị môi trường tuần 07:', result)
