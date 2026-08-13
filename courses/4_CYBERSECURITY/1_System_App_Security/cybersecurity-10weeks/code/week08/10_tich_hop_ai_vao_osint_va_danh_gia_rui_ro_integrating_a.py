"""cybersecurity-10weeks · Tuần 08 · Bài 10.

Chủ đề: Tích hợp AI vào OSINT và Đánh giá rủi ro / Integrating AI into OSINT and Risk Assessment
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('10 - Tích hợp AI vào OSINT và Đánh giá rủi ro / Integrating AI into OSINT and Risk Assessment:', result)
