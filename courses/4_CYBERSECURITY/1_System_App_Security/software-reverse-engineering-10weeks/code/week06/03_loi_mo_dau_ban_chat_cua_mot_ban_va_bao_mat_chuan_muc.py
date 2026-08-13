"""software-reverse-engineering-10weeks · Tuần 06 · Bài 03.

Chủ đề: Lời mở đầu: Bản chất của một bản vá bảo mật chuẩn mực
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('03 - Lời mở đầu: Bản chất của một bản vá bảo mật chuẩn mực:', result)
