"""raspi4-autonomous-car-10weeks · Tuần 09 · Bài 11.

Chủ đề: 2: Kiểm Tra Danh Sách ROS 2 Topics Bằng CLI
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - 2: Kiểm Tra Danh Sách ROS 2 Topics Bằng CLI:', result)
