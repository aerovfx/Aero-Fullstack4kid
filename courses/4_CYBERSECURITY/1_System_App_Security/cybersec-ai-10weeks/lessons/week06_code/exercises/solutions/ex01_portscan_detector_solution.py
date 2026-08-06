"""ĐÁP ÁN - Bài tập 1 (Tuần 6): Phát hiện quét cổng."""

from collections import defaultdict

PACKETS = [
    ("192.168.1.50", "192.168.1.10", 22,  "S"),
    ("192.168.1.50", "192.168.1.10", 23,  "S"),
    ("192.168.1.50", "192.168.1.10", 80,  "S"),
    ("192.168.1.50", "192.168.1.10", 443, "S"),
    ("192.168.1.50", "192.168.1.10", 3306,"S"),
    ("192.168.1.50", "192.168.1.10", 8080,"S"),
    ("192.168.1.20", "192.168.1.10", 443, "S"),
    ("192.168.1.20", "192.168.1.10", 443, "A"),
    ("192.168.1.99", "192.168.1.10", 21,  "S"),
    ("192.168.1.99", "192.168.1.10", 22,  "S"),
    ("192.168.1.99", "192.168.1.10", 25,  "S"),
    ("192.168.1.99", "192.168.1.10", 3389,"S"),
    ("192.168.1.99", "192.168.1.10", 5432,"S"),
]

THRESHOLD = 5


def detect_scanners(packets):
    syn_ports = defaultdict(set)
    for src, dst, dport, flag in packets:
        if flag == "S":
            syn_ports[src].add(dport)
    return {src: ports for src, ports in syn_ports.items() if len(ports) >= THRESHOLD}


if __name__ == "__main__":
    print("=== PHÁT HIỆN QUÉT CỔNG ===\n")
    scanners = detect_scanners(PACKETS)

    if not scanners:
        print("Không phát hiện quét cổng.")
    else:
        for src, ports in scanners.items():
            print(f"[!] NGHI VẤN QUÉT CỔNG: {src} đã dò {len(ports)} cổng: {sorted(ports)}")
        print("\nKHUYẾN NGHỊ:")
        print("- Chặn IP nghi vấn bằng firewall (iptables/ufw).")
        print("- Bật rate-limiting cho kết nối mới; cân nhắc IDS (Snort/Suricata).")
