"""ĐÁP ÁN - Bài tập 2 (Tuần 10): Phân loại & gộp cảnh báo SOC."""

from collections import defaultdict

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
    grouped = defaultdict(lambda: {"count": 0, "severity": "low"})
    for ip, atype, severity in raw_alerts:
        key = (ip, atype)
        grouped[key]["count"] += 1
        grouped[key]["severity"] = severity

    result = []
    for (ip, atype), info in grouped.items():
        score = SEVERITY[info["severity"]] * info["count"]
        result.append({
            "ip": ip, "type": atype, "severity": info["severity"],
            "count": info["count"], "score": score,
        })

    result.sort(key=lambda a: a["score"], reverse=True)
    return result


if __name__ == "__main__":
    print("=== PHÂN LOẠI & GỘP CẢNH BÁO SOC ===\n")
    print(f"Số cảnh báo thô: {len(RAW_ALERTS)}")

    result = triage(RAW_ALERTS)
    print(f"Sau khi gộp trùng còn: {len(result)} nhóm\n")

    print(f"{'#':<3}{'ĐIỂM':<7}{'MỨC':<10}{'SỐ LẦN':<8}{'NGUỒN':<16}LOẠI")
    print("-" * 62)
    for i, a in enumerate(result, start=1):
        print(f"{i:<3}{a['score']:<7}{a['severity']:<10}{a['count']:<8}{a['ip']:<16}{a['type']}")

    print("\n=> Analyst xử lý từ trên xuống: dòng #1 nguy hiểm & lặp nhiều nhất, ưu tiên trước.")
