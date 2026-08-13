"""cybersecurity-10weeks · Tuần 09 · Bài 18.

Chủ đề: Phụ Lục Chuyên Sâu (Deep-Dive Appendix): OWASP Top 10 & Regex Log Matching
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('18 - Phụ Lục Chuyên Sâu (Deep-Dive Appendix): OWASP Top 10 & Regex Log Matching:', result)
