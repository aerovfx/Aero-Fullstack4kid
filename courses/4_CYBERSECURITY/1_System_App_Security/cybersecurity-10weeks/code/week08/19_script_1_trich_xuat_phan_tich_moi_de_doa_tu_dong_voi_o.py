"""cybersecurity-10weeks · Tuần 08 · Bài 19.

Chủ đề: Script 1: Trích Xuất Phân Tích Mối Đe Dọa Tự Động Với OpenAI / Automated Threat Intelligen
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('19 - Script 1: Trích Xuất Phân Tích Mối Đe Dọa Tự Động Với OpenAI / Automated Threat Intelligen:', result)
