"""raspi4-autonomous-car-10weeks · Tuần 08 · Bài 10.

Chủ đề: 1: Thu Thập Dữ Liệu Lái Xe (Data Collector Script)
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('10 - 1: Thu Thập Dữ Liệu Lái Xe (Data Collector Script):', result)
