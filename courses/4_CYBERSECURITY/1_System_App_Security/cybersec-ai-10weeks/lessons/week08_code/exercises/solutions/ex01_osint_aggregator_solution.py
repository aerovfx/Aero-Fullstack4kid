"""ĐÁP ÁN - Bài tập 1 (Tuần 8): Tổng hợp OSINT."""

SHODAN = {
    "ip": "203.0.113.10",
    "hostnames": ["demo-target.example"],
    "ports": [
        {"port": 22,   "service": "OpenSSH 7.4"},
        {"port": 80,   "service": "nginx 1.14"},
        {"port": 443,  "service": "nginx 1.14"},
        {"port": 3389, "service": "Microsoft RDP"},
        {"port": 3306, "service": "MySQL 5.5"},
    ],
}

WHOIS = {
    "domain": "demo-target.example",
    "registrant_org": "Demo Corp",
    "emails": ["admin@demo-target.example", "it-support@demo-target.example"],
    "created": "2011-05-02",
}

RISKY_PORTS = {23, 3389, 3306, 21, 445}


def summarize(shodan, whois):
    open_ports = [(p["port"], p["service"]) for p in shodan["ports"]]
    risky = [(port, svc) for port, svc in open_ports if port in RISKY_PORTS]
    return {
        "ip": shodan["ip"],
        "domain": whois["domain"],
        "open_ports": open_ports,
        "risky": risky,
        "contact_emails": whois["emails"],
    }


if __name__ == "__main__":
    print("=== OSINT ATTACK SURFACE SUMMARY ===\n")
    s = summarize(SHODAN, WHOIS)

    print(f"Mục tiêu : {s['domain']} ({s['ip']})")
    print("\nCổng mở & dịch vụ:")
    for port, svc in s["open_ports"]:
        print(f"  - {port:<5} {svc}")

    print("\n[!] Dịch vụ nhạy cảm đang lộ ra:")
    if not s["risky"]:
        print("  (không có)")
    for port, svc in s["risky"]:
        print(f"  - Cổng {port} ({svc}): không nên mở ra Internet -> giới hạn bằng VPN/firewall.")

    print("\nEmail liên hệ (bề mặt phishing):")
    for email in s["contact_emails"]:
        print(f"  - {email}")
    print("  => Tổ chức cần đào tạo nhân viên nhận biết email lừa đảo (anti-phishing).")
