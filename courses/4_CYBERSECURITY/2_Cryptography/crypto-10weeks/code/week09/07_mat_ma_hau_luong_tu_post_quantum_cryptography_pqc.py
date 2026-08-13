"""crypto-10weeks · Tuần 09 · Bài 07.

Chủ đề: Mật Mã Hậu Lượng Tử (Post-Quantum Cryptography - PQC)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('07 - Mật Mã Hậu Lượng Tử (Post-Quantum Cryptography - PQC):', result)
