"""pico-stem-10weeks · Tuần 05 · Bài 11.

Chủ đề: 3: Web API Trả Dữ Liệu Cảm Biến JSON
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - 3: Web API Trả Dữ Liệu Cảm Biến JSON:', result)
