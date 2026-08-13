"""Tuần 08 · Bài 05: Chuẩn hóa domain mẫu.

Ví dụ phòng thủ, chạy offline với dữ liệu giả lập; không quét hay gọi dịch vụ ngoài.
"""
records = ["allowed", "failed", "review"]
result = [item for item in records if item != "allowed"]
assert result is not None
print("05 - Chuẩn hóa domain mẫu:", result)
