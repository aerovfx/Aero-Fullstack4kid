"""
BÀI TẬP 2 (Tuần 10): PHÂN LOẠI & GỘP CẢNH BÁO SOC (Alert Triage)
Ôn lại: SOC/SOAR, giảm "alert fatigue" (quá tải cảnh báo).

BỐI CẢNH:
Một SOC thật nhận hàng nghìn cảnh báo/ngày, nhiều cái TRÙNG nhau. Việc đầu tiên
của tự động hoá (SOAR) là: gộp trùng, chấm mức độ ưu tiên, sắp xếp để người phân
tích xử lý cái nguy hiểm nhất trước. Bài này làm đúng quy trình đó bằng thư viện chuẩn.

DỮ LIỆU: danh sách cảnh báo thô (biến RAW_ALERTS), mỗi cái gồm nguồn, loại, mức.

NHIỆM VỤ:
1. GỘP TRÙNG: các cảnh báo cùng (source_ip, type) gộp thành 1, đếm số lần (count).
2. CHẤM ĐIỂM: severity_score theo bảng SEVERITY, nhân với count.
3. SẮP XẾP: giảm dần theo điểm để cái nguy hiểm nhất lên đầu.

CHẠY:  python3 ex02_alert_triage.py
"""

from collections import defaultdict

# Cảnh báo thô: (source_ip, alert_type, severity)
RAW_ALERTS = [
    ("203.0.113.7", "SQL Injection", "critical"),
    ("192.168.1.55", "XSS", "medium"),
    ("203.0.113.7", "SQL Injection", "critical"),
    ("203.0.113.7", "Port Scan", "low"),
    ("192.168.1.55", "XSS", "medium"),
    ("203.0.113.7", "SQL Injection", "critical"),
    ("10.0.0.9", "Brute Force", "high"),
]

SEVERITY = {"low": 1, "medium": 3, "high": 7, "critical": 10}


def triage(raw_alerts):
    """
    Gộp trùng theo (ip, type), trả về list dict đã sắp xếp giảm dần theo score.
    Mỗi phần tử: {ip, type, severity, count, score}
    """
    grouped = defaultdict(lambda: {"count": 0, "severity": "low"})
    # TODO 1: duyệt raw_alerts, gom theo khoá (ip, type); tăng count; lưu severity.
    # TODO 2: chuyển thành list dict, tính score = SEVERITY[severity] * count.
    # TODO 3: sắp xếp giảm dần theo score và trả về.
    return []


if __name__ == "__main__":
    print("=== PHÂN LOẠI & GỘP CẢNH BÁO SOC ===\n")
    print(f"Số cảnh báo thô: {len(RAW_ALERTS)}")

    result = triage(RAW_ALERTS)

    # TODO 4: in bảng đã ưu tiên: THỨ TỰ | ĐIỂM | MỨC | SỐ LẦN | NGUỒN | LOẠI.
    # TODO 5: in ghi chú: cảnh báo đầu bảng là thứ analyst phải xử lý TRƯỚC.
