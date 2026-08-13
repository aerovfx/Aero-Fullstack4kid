"""raspi4-autonomous-car-10weeks · Tuần 01 · Bài 19.

Chủ đề: 💡 Đáp Án Tham Khảo Cho Bài Lab Colab (Lab Reference Solution)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('19 - 💡 Đáp Án Tham Khảo Cho Bài Lab Colab (Lab Reference Solution):', result)
