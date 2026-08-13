"""cybersecurity-10weeks · Tuần 06 · Bài 19.

Chủ đề: Phụ Lục Chuyên Sâu (Deep-Dive Appendix): Wireshark Display Filters & TCP Flags Reference
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('19 - Phụ Lục Chuyên Sâu (Deep-Dive Appendix): Wireshark Display Filters & TCP Flags Reference:', result)
