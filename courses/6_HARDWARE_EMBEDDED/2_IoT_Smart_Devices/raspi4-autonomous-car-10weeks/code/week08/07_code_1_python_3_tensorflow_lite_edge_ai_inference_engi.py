"""raspi4-autonomous-car-10weeks · Tuần 08 · Bài 07.

Chủ đề: Code 1: Python 3 - TensorFlow Lite Edge AI Inference Engine on Raspberry Pi 4
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('07 - Code 1: Python 3 - TensorFlow Lite Edge AI Inference Engine on Raspberry Pi 4:', result)
