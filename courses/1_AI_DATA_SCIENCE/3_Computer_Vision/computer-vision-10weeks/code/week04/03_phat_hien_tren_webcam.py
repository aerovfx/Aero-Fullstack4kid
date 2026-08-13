"""computer-vision-10weeks · Tuần 04 · Bài 03.

Chủ đề: Phát hiện trên webcam
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('03 - Phát hiện trên webcam:', result)
