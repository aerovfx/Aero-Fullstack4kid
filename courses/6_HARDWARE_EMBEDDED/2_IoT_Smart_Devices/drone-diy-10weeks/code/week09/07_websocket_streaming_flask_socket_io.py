"""drone-diy-10weeks · Tuần 09 · Bài 07.

Chủ đề: WebSocket Streaming: Flask + Socket.IO
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('07 - WebSocket Streaming: Flask + Socket.IO:', result)
