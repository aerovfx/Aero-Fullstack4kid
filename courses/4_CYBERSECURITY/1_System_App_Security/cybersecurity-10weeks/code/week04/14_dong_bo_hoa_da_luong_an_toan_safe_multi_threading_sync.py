"""cybersecurity-10weeks · Tuần 04 · Bài 14.

Chủ đề: Đồng bộ hóa đa luồng an toàn (Safe Multi-threading Synchronization)
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('14 - Đồng bộ hóa đa luồng an toàn (Safe Multi-threading Synchronization):', result)
