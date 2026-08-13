"""software-reverse-engineering-10weeks · Tuần 06 · Bài 11.

Chủ đề: Bước 6 — Kế hoạch Khôi phục Khẩn cấp (Rollback Plan)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - Bước 6 — Kế hoạch Khôi phục Khẩn cấp (Rollback Plan):', result)
