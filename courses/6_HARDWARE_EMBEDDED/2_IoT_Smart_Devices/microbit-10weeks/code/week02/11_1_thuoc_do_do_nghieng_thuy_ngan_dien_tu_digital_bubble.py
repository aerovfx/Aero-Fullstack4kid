"""microbit-10weeks · Tuần 02 · Bài 11.

Chủ đề: 1: Thước Đo Độ Nghiêng Thủy Ngân Điện Tử (Digital Bubble Level)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - 1: Thước Đo Độ Nghiêng Thủy Ngân Điện Tử (Digital Bubble Level):', result)
