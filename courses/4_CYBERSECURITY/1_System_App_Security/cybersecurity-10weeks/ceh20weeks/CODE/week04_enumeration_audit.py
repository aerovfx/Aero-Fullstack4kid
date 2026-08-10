#!/usr/bin/env python3
# week04_enumeration_audit.py
# ENUMERATION GUARD - Defensive audit tool (BLUE TEAM)
# CEH v13 Module 04 - Enumeration - Tuần 4
#
# ETHICS / ĐẠO ĐỨC:
#   Script này CHỈ quét MÁY CỦA CHÍNH BẠN (127.0.0.1) nhằm mục đích PHÒNG THỦ:
#   phát hiện các cổng dễ bị enumeration (SMB/NetBIOS/SNMP/LDAP/NFS/DNS) và
#   đưa ra khuyến nghị ĐÓNG cổng bằng firewall.
#   Việc quét/trích xuất thông tin hệ thống KHÔNG thuộc quyền sở hữu của bạn
#   là BẤT HỢP PHÁP (Luật An toàn thông tin mạng 2015, Nghị định 06/2022/NĐ-CP).
#   KHÔNG đổi TARGET sang IP của người khác.

import socket
import json
import datetime
import subprocess
import sys

TARGET = "127.0.0.1"
TIMEOUT = 0.4

# Các cổng điển hình bị khai thác trong giai đoạn Enumeration (CEH Module 04)
ENUM_PORTS = {
    135:  ("MS-RPC Endpoint Mapper", "tcp"),
    137:  ("NetBIOS Name Service (nbname)", "udp"),
    139:  ("NetBIOS Session / SMB", "tcp"),
    445:  ("SMB over TCP", "tcp"),
    161:  ("SNMP Agent", "udp"),
    162:  ("SNMP Trap", "udp"),
    389:  ("LDAP", "tcp"),
    53:   ("DNS (risky for zone transfer)", "tcp"),
    111:  ("RPCbind / NFS helper", "tcp"),
    2049: ("NFS", "tcp"),
}


def tcp_open(port):
    """Check if a TCP port is open on localhost."""
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.settimeout(TIMEOUT)
    try:
        return sock.connect_ex((TARGET, port)) == 0
    finally:
        sock.close()


def udp_probe(port):
    """Probe a UDP port. Open/closed/unknown (filtered)."""
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.settimeout(0.8)
    try:
        sock.sendto(b"", (TARGET, port))
        sock.recvfrom(128)
        return True
    except socket.timeout:
        return None          # no ICMP response -> likely filtered/open
    except ConnectionRefusedError:
        return False         # ICMP port unreachable -> closed
    finally:
        sock.close()


def report_line(port, service, proto, status):
    """One summary line for a port entry."""
    if status is True:
        return (f"[!] OPEN  : {port:>5}/{proto:<4} {service:<34} "
                f"-> CỬA SỔ ENUMERATION, NÊN ĐÓNG")
    if status is None:
        return (f"[?] AMBIG : {port:>5}/{proto:<4} {service:<34} "
                f"(UDP filtered/no reply - kiểm tra firewall)")
    return f"[-] CLOSED: {port:>5}/{proto:<4} {service:<34}"


def recommend_close(port, proto):
    """Give a concrete firewall/registry command to close the port on this OS."""
    if sys.platform.startswith("darwin"):
        return (
            f"sudo /usr/libexec/ApplicationFirewall/socketfilterfw "
            f"--addblocked 127.0.0.1:{port}"
        )
    # Linux / WSL / generic
    return f"sudo ufw deny {port}/{proto}"


def check_port(port, proto):
    return tcp_open(port) if proto == "tcp" else udp_probe(port)


def main():
    print("=" * 62)
    print("  ENUMERATION GUARD - Soát cổng enumeration trên máy của BẠN")
    print(f"  Target : {TARGET}  (chỉ localhost - CHỈ PHÒNG THỦ)")
    print(f"  Thời gian: {datetime.datetime.now():%Y-%m-%d %H:%M}")
    print("=" * 62)

    report = {
        "host": TARGET,
        "scanned_at": str(datetime.datetime.now()),
        "tool": "week04_enumeration_audit.py (CEHv13 Module 04)",
        "results": [],
    }
    open_ports = []

    for port, (service, proto) in ENUM_PORTS.items():
        status = check_port(port, proto)
        print(report_line(port, service, proto, status))
        entry = {"port": port, "protocol": proto, "service": service}
        if status is True:
            open_ports.append(port)
            entry.update({"state": "open",
                          "recommendation": recommend_close(port, proto)})
        elif status is None:
            entry.update({"state": "unknown",
                          "note": "UDP filtered/no reply - verify with firewall log"})
        else:
            entry.update({"state": "closed"})
        report["results"].append(entry)

    print("-" * 62)
    if open_ports:
        print(f"[KẾT QUẢ] {len(open_ports)} cổng enumeration đang MỞ trên máy bạn:")
        for p in open_ports:
            proto = dict((k, v[1]) for k, v in ENUM_PORTS.items())[p]
            print(f"    - Port {p}/{proto}: {recommend_close(p, proto)}")
        report["risk_level"] = "HIGH"
    else:
        print("[KẾT QUẢ] Không phát hiện cổng enumeration nào mở. Bề mặt tấn công tốt.")
        report["risk_level"] = "LOW"

    # Bật/tắt dịch vụ: gợi ý lệnh kiểm tra tiến trình (không chạy lệnh sudo tự động)
    print("\n[*] Lệnh kiểm tra tiến trình đang LISTEN (tham khảo, chỉ đọc):")
    if sys.platform.startswith("darwin"):
        print("    lsof -i -P | grep LISTEN")
    else:
        print("    ss -tlnup")

    with open("enumeration_audit_report.json", "w", encoding="utf-8") as f:
        json.dump(report, f, ensure_ascii=False, indent=2)
    print("\n[+] Báo cáo JSON đã ghi: enumeration_audit_report.json")
    print("    -> Sau khi đóng cổng, chạy lại script để xác nhận hết OPEN.")


if __name__ == "__main__":
    main()