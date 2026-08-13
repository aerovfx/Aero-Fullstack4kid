"""crypto-10weeks · Tuần 02 · Bài 07.

Chủ đề: Thuật Toán AES (Advanced Encryption Standard)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('07 - Thuật Toán AES (Advanced Encryption Standard):', result)
