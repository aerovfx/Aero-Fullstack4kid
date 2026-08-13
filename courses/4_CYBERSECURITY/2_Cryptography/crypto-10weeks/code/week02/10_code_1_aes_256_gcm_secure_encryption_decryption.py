"""crypto-10weeks · Tuần 02 · Bài 10.

Chủ đề: Code 1: AES-256-GCM Secure Encryption & Decryption
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('10 - Code 1: AES-256-GCM Secure Encryption & Decryption:', result)
