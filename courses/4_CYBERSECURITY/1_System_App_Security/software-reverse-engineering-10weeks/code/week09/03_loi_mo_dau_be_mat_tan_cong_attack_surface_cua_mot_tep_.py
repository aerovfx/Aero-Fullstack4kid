"""software-reverse-engineering-10weeks · Tuần 09 · Bài 03.

Chủ đề: Lời mở đầu: Bề mặt tấn công (Attack Surface) của một Tệp PE GUI
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('03 - Lời mở đầu: Bề mặt tấn công (Attack Surface) của một Tệp PE GUI:', result)
