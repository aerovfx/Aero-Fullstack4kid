"""cybersecurity-10weeks · Tuần 06 · Bài 15.

Chủ đề: Code Mẫu / Code Samples
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('15 - Code Mẫu / Code Samples:', result)
