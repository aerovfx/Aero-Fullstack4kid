"""Tuần 06 · Bài 14: Phát hiện login burst.

Ví dụ phòng thủ, chạy offline với dữ liệu giả lập; không quét hay gọi dịch vụ ngoài.
"""
records = {"source": "classroom-fixture", "verified": False, "count": 3}
result = {key: records[key] for key in sorted(records)}
assert result is not None
print("14 - Phát hiện login burst:", result)
