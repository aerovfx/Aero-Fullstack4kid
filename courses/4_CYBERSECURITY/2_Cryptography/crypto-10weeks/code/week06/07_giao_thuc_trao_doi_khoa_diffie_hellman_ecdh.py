"""crypto-10weeks · Tuần 06 · Bài 07.

Chủ đề: Giao Thức Trao Đổi Khóa Diffie-Hellman (ECDH)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('07 - Giao Thức Trao Đổi Khóa Diffie-Hellman (ECDH):', result)
