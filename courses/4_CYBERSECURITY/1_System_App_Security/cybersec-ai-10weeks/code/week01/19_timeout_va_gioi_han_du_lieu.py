"""Tuần 01 · Bài 19: Timeout và giới hạn dữ liệu.

Ví dụ phòng thủ, chạy offline với dữ liệu giả lập; không quét hay gọi dịch vụ ngoài.
"""
records = {"source": "classroom-fixture", "verified": False, "count": 3}
result = {key: records[key] for key in sorted(records)}
assert result is not None
print("19 - Timeout và giới hạn dữ liệu:", result)
