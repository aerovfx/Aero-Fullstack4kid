"""ĐÁP ÁN - Bài tập 1 (Tuần 5): Báo cáo rủi ro dịch vụ."""

SAMPLE_SS = """Netid  State   Local Address:Port   Peer Address:Port
tcp    LISTEN  127.0.0.1:5432       0.0.0.0:*
tcp    LISTEN  0.0.0.0:22           0.0.0.0:*
tcp    LISTEN  0.0.0.0:23           0.0.0.0:*
tcp    LISTEN  0.0.0.0:80           0.0.0.0:*
tcp    LISTEN  127.0.0.1:8080       0.0.0.0:*
tcp    LISTEN  0.0.0.0:3389         0.0.0.0:*
"""

RISK = {
    22:   ("SSH", "TRUNG BÌNH"),
    23:   ("Telnet", "RẤT CAO"),
    80:   ("HTTP", "TRUNG BÌNH"),
    443:  ("HTTPS", "THẤP"),
    3389: ("RDP", "RẤT CAO"),
    5432: ("PostgreSQL", "CAO"),
    8080: ("HTTP-Alt", "TRUNG BÌNH"),
}


def parse_listening(ss_output):
    results = []
    for line in ss_output.strip().splitlines():
        if "LISTEN" not in line:
            continue
        cols = line.split()
        local = cols[2]                 # "127.0.0.1:5432"
        addr, port = local.rsplit(":", 1)
        results.append((addr, int(port)))
    return results


def scope_of(addr):
    return "localhost (an toàn hơn)" if addr.startswith("127.") else "LỘ RA MẠNG (!)"


if __name__ == "__main__":
    print("=== BÁO CÁO RỦI RO DỊCH VỤ (từ ss -tulpn) ===\n")
    services = parse_listening(SAMPLE_SS)

    print(f"{'CỔNG':<7}{'DỊCH VỤ':<13}{'RỦI RO':<12}PHẠM VI")
    print("-" * 62)
    exposed_risky = []
    for addr, port in sorted(services, key=lambda x: x[1]):
        name, risk = RISK.get(port, ("Không rõ", "?"))
        scope = scope_of(addr)
        print(f"{port:<7}{name:<13}{risk:<12}{scope}")
        if risk in ("CAO", "RẤT CAO") and not addr.startswith("127."):
            exposed_risky.append((port, name, risk))

    print("\nKHUYẾN NGHỊ:")
    if not exposed_risky:
        print("- Không có dịch vụ rủi ro cao nào lộ ra mạng. Tốt!")
    else:
        for port, name, risk in exposed_risky:
            print(f"- Cổng {port} ({name}) [{risk}] đang lộ ra mạng: "
                  f"tắt dịch vụ nếu không dùng, hoặc bind về 127.0.0.1, hoặc chặn bằng firewall.")
