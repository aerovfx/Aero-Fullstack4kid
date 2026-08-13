"""cybersecurity-10weeks · Tuần 10 · Bài 12.

Chủ đề: Hệ thống giám sát bảo mật tự động / Automated Security Monitoring System
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('12 - Hệ thống giám sát bảo mật tự động / Automated Security Monitoring System:', result)
