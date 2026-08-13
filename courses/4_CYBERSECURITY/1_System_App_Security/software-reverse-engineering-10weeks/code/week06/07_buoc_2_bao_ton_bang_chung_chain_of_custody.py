"""software-reverse-engineering-10weeks · Tuần 06 · Bài 07.

Chủ đề: Bước 2 — Bảo tồn Bằng chứng (Chain of Custody)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('07 - Bước 2 — Bảo tồn Bằng chứng (Chain of Custody):', result)
