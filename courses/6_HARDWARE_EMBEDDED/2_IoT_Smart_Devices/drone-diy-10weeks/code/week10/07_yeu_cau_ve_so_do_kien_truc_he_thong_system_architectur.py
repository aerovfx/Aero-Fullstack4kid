"""drone-diy-10weeks · Tuần 10 · Bài 07.

Chủ đề: Yêu Cầu Về Sơ Đồ Kiến Trúc Hệ Thống / System Architecture Diagram Requirements
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('07 - Yêu Cầu Về Sơ Đồ Kiến Trúc Hệ Thống / System Architecture Diagram Requirements:', result)
