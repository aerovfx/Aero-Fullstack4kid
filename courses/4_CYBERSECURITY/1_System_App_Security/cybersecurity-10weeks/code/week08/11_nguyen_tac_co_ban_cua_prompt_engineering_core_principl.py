"""cybersecurity-10weeks · Tuần 08 · Bài 11.

Chủ đề: Nguyên tắc Cơ bản của Prompt Engineering / Core Principles of Prompt Engineering
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - Nguyên tắc Cơ bản của Prompt Engineering / Core Principles of Prompt Engineering:', result)
