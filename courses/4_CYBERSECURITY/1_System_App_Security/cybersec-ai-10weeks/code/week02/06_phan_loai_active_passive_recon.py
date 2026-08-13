"""Tuần 02 · Bài 06: Phân loại active passive recon.

Ví dụ phòng thủ, chạy offline với dữ liệu giả lập; không quét hay gọi dịch vụ ngoài.
"""
records = [{"id": "evt-01", "score": 20}, {"id": "evt-02", "score": 80}]
result = [item for item in records if item["score"] >= 50]
assert result is not None
print("06 - Phân loại active passive recon:", result)
