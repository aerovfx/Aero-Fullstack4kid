"""cybersecurity-10weeks · Tuần 09 · Bài 19.

Chủ đề: Các Mẫu Biểu Thức Chính Quy (Regex) Phân Tích Web Log Phổ Biến
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('19 - Các Mẫu Biểu Thức Chính Quy (Regex) Phân Tích Web Log Phổ Biến:', result)
