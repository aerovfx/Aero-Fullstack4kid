"""microbit-10weeks · Tuần 07 · Bài 07.

Chủ đề: Code 1: MicroPython - Automated Smart Plant Watering Engine
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('07 - Code 1: MicroPython - Automated Smart Plant Watering Engine:', result)
