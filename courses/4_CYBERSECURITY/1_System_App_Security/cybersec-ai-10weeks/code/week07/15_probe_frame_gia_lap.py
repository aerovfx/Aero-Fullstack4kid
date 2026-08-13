"""Tuần 07 · Bài 15: Probe frame giả lập.

Ví dụ phòng thủ, chạy offline với dữ liệu giả lập; không quét hay gọi dịch vụ ngoài.
"""
records = ["allowed", "failed", "review"]
result = [item for item in records if item != "allowed"]
assert result is not None
print("15 - Probe frame giả lập:", result)
