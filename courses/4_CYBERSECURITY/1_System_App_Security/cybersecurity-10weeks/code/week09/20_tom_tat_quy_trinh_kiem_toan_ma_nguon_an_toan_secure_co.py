"""cybersecurity-10weeks · Tuần 09 · Bài 20.

Chủ đề: Tóm Tắt Quy Trình Kiểm Toán Mã Nguồn An Toàn (Secure Code Audit Lifecycle)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('20 - Tóm Tắt Quy Trình Kiểm Toán Mã Nguồn An Toàn (Secure Code Audit Lifecycle):', result)
