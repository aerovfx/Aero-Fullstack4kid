"""drone-diy-10weeks · Tuần 09 · Bài 04.

Chủ đề: Telemetry Radio Modules (433MHz vs 915MHz) & SiK Radio
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('04 - Telemetry Radio Modules (433MHz vs 915MHz) & SiK Radio:', result)
