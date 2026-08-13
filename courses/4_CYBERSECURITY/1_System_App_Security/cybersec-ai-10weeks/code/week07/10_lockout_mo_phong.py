"""Tuần 07 · Bài 10: Lockout mô phỏng.

Ví dụ phòng thủ, chạy offline với dữ liệu giả lập; không quét hay gọi dịch vụ ngoài.
"""
records = ["allowed", "failed", "review"]
result = [item for item in records if item != "allowed"]
assert result is not None
print("10 - Lockout mô phỏng:", result)
