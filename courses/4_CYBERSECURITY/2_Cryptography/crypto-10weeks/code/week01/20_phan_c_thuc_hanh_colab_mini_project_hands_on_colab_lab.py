"""crypto-10weeks · Tuần 01 · Bài 20.

Chủ đề: 🔴 Phần C: Thực Hành Colab / Mini Project (Hands-on Colab Lab)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('20 - 🔴 Phần C: Thực Hành Colab / Mini Project (Hands-on Colab Lab):', result)
