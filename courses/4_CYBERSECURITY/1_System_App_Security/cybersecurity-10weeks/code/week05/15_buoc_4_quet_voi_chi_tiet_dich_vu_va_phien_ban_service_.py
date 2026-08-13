"""cybersecurity-10weeks · Tuần 05 · Bài 15.

Chủ đề: Bước 4: Quét với chi tiết dịch vụ và phiên bản (Service/Version Detection)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('15 - Bước 4: Quét với chi tiết dịch vụ và phiên bản (Service/Version Detection):', result)
