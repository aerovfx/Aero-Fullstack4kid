"""pico-stem-10weeks · Tuần 08 · Bài 11.

Chủ đề: 3: Xe Robot Điều Khiển Từ Xa Qua Web Server Wi-Fi (Pico W Web Car)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - 3: Xe Robot Điều Khiển Từ Xa Qua Web Server Wi-Fi (Pico W Web Car):', result)
