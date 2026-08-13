"""raspi4-autonomous-car-10weeks · Tuần 03 · Bài 11.

Chủ đề: 1: Đo Tốc Độ Khung Hình FPS Camera CSI (FPS Benchmark)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - 1: Đo Tốc Độ Khung Hình FPS Camera CSI (FPS Benchmark):', result)
