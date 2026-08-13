"""cybersecurity-10weeks · Tuần 01 · Bài 07.

Chủ đề: Thực Hành Code / Hands-On (Từ Cơ Bản Đến Phức Tạp)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('07 - Thực Hành Code / Hands-On (Từ Cơ Bản Đến Phức Tạp):', result)
