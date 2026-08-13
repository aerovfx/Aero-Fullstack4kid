"""pico-stem-10weeks · Tuần 06 · Bài 11.

Chủ đề: 3: Tự Động Khôi Phục Kết Nối MQTT (Auto-Reconnect Pattern)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - 3: Tự Động Khôi Phục Kết Nối MQTT (Auto-Reconnect Pattern):', result)
