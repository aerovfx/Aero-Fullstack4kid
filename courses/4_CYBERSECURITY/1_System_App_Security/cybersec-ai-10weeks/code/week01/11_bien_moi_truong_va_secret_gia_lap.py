"""Tuần 01 · Bài 11: Biến môi trường và secret giả lập.

Ví dụ phòng thủ, chạy offline với dữ liệu giả lập; không quét hay gọi dịch vụ ngoài.
"""
records = [{"id": "evt-01", "score": 20}, {"id": "evt-02", "score": 80}]
result = [item for item in records if item["score"] >= 50]
assert result is not None
print("11 - Biến môi trường và secret giả lập:", result)
