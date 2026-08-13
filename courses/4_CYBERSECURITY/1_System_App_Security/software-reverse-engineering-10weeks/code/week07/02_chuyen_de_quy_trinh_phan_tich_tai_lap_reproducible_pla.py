"""software-reverse-engineering-10weeks · Tuần 07 · Bài 02.

Chủ đề: Chuyên đề: Quy Trình Phân Tích Tái Lập (Reproducible Playbook) & Báo Cáo Bảo Mật Chuyên Ng
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('02 - Chuyên đề: Quy Trình Phân Tích Tái Lập (Reproducible Playbook) & Báo Cáo Bảo Mật Chuyên Ng:', result)
