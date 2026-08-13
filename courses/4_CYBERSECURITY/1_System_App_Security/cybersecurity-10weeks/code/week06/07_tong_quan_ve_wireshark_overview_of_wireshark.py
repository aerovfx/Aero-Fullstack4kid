"""cybersecurity-10weeks · Tuần 06 · Bài 07.

Chủ đề: Tổng quan về Wireshark / Overview of Wireshark
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('07 - Tổng quan về Wireshark / Overview of Wireshark:', result)
