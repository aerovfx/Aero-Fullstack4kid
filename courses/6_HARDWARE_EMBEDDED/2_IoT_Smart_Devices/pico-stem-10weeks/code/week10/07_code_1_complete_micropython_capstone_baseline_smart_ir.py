"""pico-stem-10weeks · Tuần 10 · Bài 07.

Chủ đề: Code 1: Complete MicroPython Capstone Baseline - Smart Irrigation & Cloud Telemetry
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('07 - Code 1: Complete MicroPython Capstone Baseline - Smart Irrigation & Cloud Telemetry:', result)
