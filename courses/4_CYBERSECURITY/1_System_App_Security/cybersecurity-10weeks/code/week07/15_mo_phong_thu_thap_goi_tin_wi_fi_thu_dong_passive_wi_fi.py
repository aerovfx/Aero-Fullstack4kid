"""cybersecurity-10weeks · Tuần 07 · Bài 15.

Chủ đề: Mô phỏng Thu thập Gói tin Wi-Fi thụ động (Passive Wi-Fi Sniffing Simulation)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('15 - Mô phỏng Thu thập Gói tin Wi-Fi thụ động (Passive Wi-Fi Sniffing Simulation):', result)
