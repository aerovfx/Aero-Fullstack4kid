"""crypto-10weeks · Tuần 06 · Bài 19.

Chủ đề: 4: So Sánh Tốc Độ Sinh Khóa & Trao Đổi Khóa RSA-3072 vs ECC Curve25519
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('19 - 4: So Sánh Tốc Độ Sinh Khóa & Trao Đổi Khóa RSA-3072 vs ECC Curve25519:', result)
