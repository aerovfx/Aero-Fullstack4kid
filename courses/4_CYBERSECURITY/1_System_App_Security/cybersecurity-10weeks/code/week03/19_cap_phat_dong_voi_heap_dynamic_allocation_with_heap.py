"""cybersecurity-10weeks · Tuần 03 · Bài 19.

Chủ đề: Cấp phát Động với Heap (Dynamic Allocation with Heap)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('19 - Cấp phát Động với Heap (Dynamic Allocation with Heap):', result)
