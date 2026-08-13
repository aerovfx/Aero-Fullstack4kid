"""crypto-10weeks · Tuần 10 · Bài 07.

Chủ đề: Sơ Đồ Khối Cryptographic Protocol Suite (Signal-like Concept)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('07 - Sơ Đồ Khối Cryptographic Protocol Suite (Signal-like Concept):', result)
