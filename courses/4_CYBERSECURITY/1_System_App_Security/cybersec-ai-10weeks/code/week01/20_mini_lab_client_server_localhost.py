"""Tuần 01 · Bài 20: Mini lab client server localhost.

Ví dụ phòng thủ, chạy offline với dữ liệu giả lập; không quét hay gọi dịch vụ ngoài.
"""
records = ["allowed", "failed", "review"]
result = [item for item in records if item != "allowed"]
assert result is not None
print("20 - Mini lab client server localhost:", result)
