"""cybersecurity-10weeks · Tuần 03 · Bài 20.

Chủ đề: Trải nghiệm Rò rỉ Bộ nhớ (Experiencing Memory Leaks) (LÀM CẨN THẬN)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('20 - Trải nghiệm Rò rỉ Bộ nhớ (Experiencing Memory Leaks) (LÀM CẨN THẬN):', result)
