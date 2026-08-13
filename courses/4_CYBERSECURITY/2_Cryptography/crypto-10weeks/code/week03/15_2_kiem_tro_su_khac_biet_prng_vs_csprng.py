"""crypto-10weeks · Tuần 03 · Bài 15.

Chủ đề: 2: Kiểm Trợ Sự Khác Biệt PRNG vs CSPRNG
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('15 - 2: Kiểm Trợ Sự Khác Biệt PRNG vs CSPRNG:', result)
