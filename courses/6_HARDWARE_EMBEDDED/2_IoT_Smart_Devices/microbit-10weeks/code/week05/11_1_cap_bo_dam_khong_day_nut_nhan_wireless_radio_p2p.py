"""microbit-10weeks · Tuần 05 · Bài 11.

Chủ đề: 1: Cặp Bộ Đàm Không Dây Nút Nhấn (Wireless Radio P2P)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - 1: Cặp Bộ Đàm Không Dây Nút Nhấn (Wireless Radio P2P):', result)
