"""software-reverse-engineering-10weeks · Tuần 07 · Bài 03.

Chủ đề: Lời mở đầu: Tầm quan trọng của tính Tái lập (Reproducibility) trong Security Reporting
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('03 - Lời mở đầu: Tầm quan trọng của tính Tái lập (Reproducibility) trong Security Reporting:', result)
