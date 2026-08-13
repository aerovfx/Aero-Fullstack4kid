"""crypto-10weeks · Tuần 08 · Bài 16.

Chủ đề: 3: Đo Đoạc Tốc Độ Bẻ Khóa Vét Cạn (GPU Cracking Slowdown Benchmark)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('16 - 3: Đo Đoạc Tốc Độ Bẻ Khóa Vét Cạn (GPU Cracking Slowdown Benchmark):', result)
