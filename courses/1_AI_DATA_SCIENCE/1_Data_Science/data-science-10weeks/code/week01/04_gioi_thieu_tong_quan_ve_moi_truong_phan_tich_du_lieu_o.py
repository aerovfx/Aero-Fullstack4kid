"""data-science-10weeks · Tuần 01 · Bài 04.

Chủ đề: Giới thiệu tổng quan về Môi trường Phân tích Dữ liệu (Overview)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('04 - Giới thiệu tổng quan về Môi trường Phân tích Dữ liệu (Overview):', result)
