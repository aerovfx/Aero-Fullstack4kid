"""software-reverse-engineering-10weeks · Tuần 10 · Bài 03.

Chủ đề: Lời mở đầu: Mô hình Đe dọa (Threat Model) cho Ứng dụng Máy Trạm
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('03 - Lời mở đầu: Mô hình Đe dọa (Threat Model) cho Ứng dụng Máy Trạm:', result)
