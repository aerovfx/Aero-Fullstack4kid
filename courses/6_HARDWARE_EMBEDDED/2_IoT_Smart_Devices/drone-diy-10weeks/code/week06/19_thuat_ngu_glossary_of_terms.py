"""drone-diy-10weeks · Tuần 06 · Bài 19.

Chủ đề: Thuật Ngữ (Glossary of Terms)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('19 - Thuật Ngữ (Glossary of Terms):', result)
