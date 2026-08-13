"""cybersecurity-10weeks · Tuần 01 · Bài 03.

Chủ đề: Tại sao Python lại thống trị lĩnh vực An ninh mạng?
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('03 - Tại sao Python lại thống trị lĩnh vực An ninh mạng?:', result)
