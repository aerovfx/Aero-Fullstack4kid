"""raspi4-autonomous-car-10weeks · Tuần 08 · Bài 15.

Chủ đề: 4: Huấn Luyện & Kiểm Thử Mô Hình TFLite Trên Google Colab
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('15 - 4: Huấn Luyện & Kiểm Thử Mô Hình TFLite Trên Google Colab:', result)
