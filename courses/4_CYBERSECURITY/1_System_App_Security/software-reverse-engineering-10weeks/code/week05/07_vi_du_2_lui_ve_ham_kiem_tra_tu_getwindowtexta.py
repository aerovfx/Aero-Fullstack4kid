"""software-reverse-engineering-10weeks · Tuần 05 · Bài 07.

Chủ đề: Ví dụ 2: Lùi về hàm kiểm tra từ GetWindowTextA
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('07 - Ví dụ 2: Lùi về hàm kiểm tra từ GetWindowTextA:', result)
