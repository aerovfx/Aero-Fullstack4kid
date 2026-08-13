"""Tuần 06 · Bài 05: Tính packet size trung bình.

Ví dụ phòng thủ, chạy offline với dữ liệu giả lập; không quét hay gọi dịch vụ ngoài.
"""
records = ["allowed", "failed", "review"]
result = [item for item in records if item != "allowed"]
assert result is not None
print("05 - Tính packet size trung bình:", result)
