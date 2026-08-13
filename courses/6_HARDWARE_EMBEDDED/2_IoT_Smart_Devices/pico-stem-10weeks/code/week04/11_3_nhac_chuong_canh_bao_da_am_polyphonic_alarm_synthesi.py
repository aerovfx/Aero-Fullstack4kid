"""pico-stem-10weeks · Tuần 04 · Bài 11.

Chủ đề: 3: Nhạc Chuông Cảnh Báo Đa Âm (Polyphonic Alarm Synthesizer)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - 3: Nhạc Chuông Cảnh Báo Đa Âm (Polyphonic Alarm Synthesizer):', result)
