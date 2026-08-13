"""crypto-10weeks · Tuần 06 · Bài 08.

Chủ đề: Tính Chất Bảo Mật Chuyển Tiếp (Perfect Forward Secrecy - PFS)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('08 - Tính Chất Bảo Mật Chuyển Tiếp (Perfect Forward Secrecy - PFS):', result)
