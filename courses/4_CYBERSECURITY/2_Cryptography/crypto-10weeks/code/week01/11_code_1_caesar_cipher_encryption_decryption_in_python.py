"""crypto-10weeks · Tuần 01 · Bài 11.

Chủ đề: Code 1: Caesar Cipher Encryption & Decryption in Python
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - Code 1: Caesar Cipher Encryption & Decryption in Python:', result)
