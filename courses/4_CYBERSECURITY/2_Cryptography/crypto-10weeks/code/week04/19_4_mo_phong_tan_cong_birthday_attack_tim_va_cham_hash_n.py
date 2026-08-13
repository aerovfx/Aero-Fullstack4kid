"""crypto-10weeks · Tuần 04 · Bài 19.

Chủ đề: 4: Mô Phỏng Tấn Công Birthday Attack Tìm Va Chạm Hash Ngắn
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('19 - 4: Mô Phỏng Tấn Công Birthday Attack Tìm Va Chạm Hash Ngắn:', result)
