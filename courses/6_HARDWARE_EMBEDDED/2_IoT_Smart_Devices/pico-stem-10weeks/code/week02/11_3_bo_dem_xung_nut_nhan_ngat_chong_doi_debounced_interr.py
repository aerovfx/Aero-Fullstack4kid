"""pico-stem-10weeks · Tuần 02 · Bài 11.

Chủ đề: 3: Bộ Đếm Xung Nút Nhấn Ngắt Chống Dội (Debounced Interrupt Counter)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - 3: Bộ Đếm Xung Nút Nhấn Ngắt Chống Dội (Debounced Interrupt Counter):', result)
