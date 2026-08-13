"""drone-diy-10weeks · Tuần 07 · Bài 17.

Chủ đề: Phụ Lục & FAQ / Appendix & FAQ
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('17 - Phụ Lục & FAQ / Appendix & FAQ:', result)
