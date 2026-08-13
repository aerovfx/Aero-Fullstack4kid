"""drone-diy-10weeks · Tuần 07 · Bài 09.

Chủ đề: Hàng Rào Điện Tử (Geofence)
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - Hàng Rào Điện Tử (Geofence):', result)
