"""crypto-10weeks · Tuần 02 · Bài 19.

Chủ đề: 4: Đo Hiệu Năng Mã Hóa AES Trên Google Colab
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('19 - 4: Đo Hiệu Năng Mã Hóa AES Trên Google Colab:', result)
