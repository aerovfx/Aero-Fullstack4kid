"""Tuần 02 · Bài 15: Ghi nhận kết quả scan.

Ví dụ phòng thủ, chạy offline với dữ liệu giả lập; không quét hay gọi dịch vụ ngoài.
"""
records = ["allowed", "failed", "review"]
result = [item for item in records if item != "allowed"]
assert result is not None
print("15 - Ghi nhận kết quả scan:", result)
