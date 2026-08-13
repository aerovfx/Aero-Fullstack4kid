"""raspi4-autonomous-car-10weeks · Tuần 04 · Bài 07.

Chủ đề: Code 1: Python 3 - OpenCV Lane Edge Extraction & ROI Cropping Pipeline
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('07 - Code 1: Python 3 - OpenCV Lane Edge Extraction & ROI Cropping Pipeline:', result)
