"""microbit-10weeks · Tuần 01 · Bài 19.

Chủ đề: 🔴 Phần C: Thực Hành Colab / Giả Lập MakeCode (Hands-on Colab Lab)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('19 - 🔴 Phần C: Thực Hành Colab / Giả Lập MakeCode (Hands-on Colab Lab):', result)
