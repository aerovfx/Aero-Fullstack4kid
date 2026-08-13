"""crypto-10weeks · Tuần 03 · Bài 07.

Chủ đề: Thuật Toán ChaCha20 & Poly1305
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('07 - Thuật Toán ChaCha20 & Poly1305:', result)
