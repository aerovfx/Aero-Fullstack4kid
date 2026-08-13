"""cybersecurity-10weeks · Tuần 08 · Bài 15.

Chủ đề: Bài Thực Hành 1: Thiết Kế Prompt (Prompt Engineering) Căn Bản
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('15 - Bài Thực Hành 1: Thiết Kế Prompt (Prompt Engineering) Căn Bản:', result)
