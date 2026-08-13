"""crypto-10weeks · Tuần 03 · Bài 19.

Chủ đề: 4: So Sánh Tốc Độ Mã Hóa ChaCha20 vs AES-GCM Trên Mobile Colab
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('19 - 4: So Sánh Tốc Độ Mã Hóa ChaCha20 vs AES-GCM Trên Mobile Colab:', result)
