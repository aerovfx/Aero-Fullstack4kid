"""Tuần 05 · Bài 11: So sánh hai lần inventory.

Ví dụ phòng thủ, chạy offline với dữ liệu giả lập; không quét hay gọi dịch vụ ngoài.
"""
records = [{"id": "evt-01", "score": 20}, {"id": "evt-02", "score": 80}]
result = [item for item in records if item["score"] >= 50]
assert result is not None
print("11 - So sánh hai lần inventory:", result)
