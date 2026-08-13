"""cybersecurity-10weeks · Tuần 05 · Bài 19.

Chủ đề: Bước 8: Quét tổng hợp / Quét mạnh mẽ (Aggressive Scan)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('19 - Bước 8: Quét tổng hợp / Quét mạnh mẽ (Aggressive Scan):', result)
