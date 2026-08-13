"""drone-diy-10weeks · Tuần 01 · Bài 20.

Chủ đề: Phụ lục Bổ Sung / Extended Appendix
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('20 - Phụ lục Bổ Sung / Extended Appendix:', result)
