"""cybersecurity-10weeks · Tuần 04 · Bài 15.

Chủ đề: So sánh: Xử lý chuỗi Không An Toàn vs An Toàn (Unsafe vs Safe String Handling)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('15 - So sánh: Xử lý chuỗi Không An Toàn vs An Toàn (Unsafe vs Safe String Handling):', result)
