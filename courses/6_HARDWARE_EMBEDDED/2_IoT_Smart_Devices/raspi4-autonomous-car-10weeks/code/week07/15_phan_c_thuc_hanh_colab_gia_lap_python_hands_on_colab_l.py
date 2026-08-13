"""raspi4-autonomous-car-10weeks · Tuần 07 · Bài 15.

Chủ đề: 🔴 Phần C: Thực Hành Colab / Giả Lập Python (Hands-on Colab Lab)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('15 - 🔴 Phần C: Thực Hành Colab / Giả Lập Python (Hands-on Colab Lab):', result)
