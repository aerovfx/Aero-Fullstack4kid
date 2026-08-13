"""crypto-10weeks · Tuần 01 · Bài 19.

Chủ đề: 3: Phân Tích Độ Dài Từ Khóa Vigenère Bằng Chỉ Số Trùng Khớp (Index of Coincidence - IC)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('19 - 3: Phân Tích Độ Dài Từ Khóa Vigenère Bằng Chỉ Số Trùng Khớp (Index of Coincidence - IC):', result)
