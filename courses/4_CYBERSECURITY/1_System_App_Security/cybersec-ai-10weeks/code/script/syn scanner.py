"""
Phase 6 (mo rong, tuy chon) - SYN Scan ("half-open scan")
============================================================
Khac voi Phase 2 (TCP connect scan - bat tay 3 buoc day du), SYN scan chi
gui goi SYN va doc phan hoi SYN-ACK/RST ma KHONG hoan tat bat tay -> nhanh
hon va it de lai log ket noi day du tren server dich (giong co che "-sS"
cua nmap that).

YEU CAU:
  - Can quyen root/administrator (raw socket)
  - Can cai `scapy`: pip install scapy
  - CHUA duoc test trong moi truong nay (khong co mang/quyen root san sang)
    -> hay tu kiem tra tren mang lab cua ban truoc khi dung that.

Logic phan hoi:
  - Nhan SYN-ACK (flags = 0x12) -> cong OPEN, sau do gui RST de dong ket noi
    (khong hoan tat bat tay 3 buoc)
  - Nhan RST (flags = 0x14)     -> cong CLOSED
  - Khong phan hoi (timeout)    -> cong FILTERED (co the bi firewall chan)
"""

from dataclasses import dataclass

try:
    from scapy.all import IP, TCP, sr1, RandShort
    SCAPY_AVAILABLE = True
except ImportError:
    SCAPY_AVAILABLE = False


@dataclass
class SynResult:
    port: int
    state: str


def syn_scan_port(host: str, port: int, timeout: float = 1.0) -> SynResult:
    if not SCAPY_AVAILABLE:
        raise RuntimeError("Can cai dat scapy: pip install scapy")

    src_port = RandShort()
    packet = IP(dst=host) / TCP(sport=src_port, dport=port, flags="S")
    response = sr1(packet, timeout=timeout, verbose=0)

    if response is None:
        return SynResult(port, "filtered")

    if response.haslayer(TCP):
        flags = response.getlayer(TCP).flags
        if flags == 0x12:  # SYN-ACK
            # Gui RST de dong ket noi lich su, tranh de lai half-open connection
            rst_packet = IP(dst=host) / TCP(sport=src_port, dport=port, flags="R")
            sr1(rst_packet, timeout=0.5, verbose=0)
            return SynResult(port, "open")
        elif flags == 0x14:  # RST-ACK
            return SynResult(port, "closed")

    return SynResult(port, "filtered")


def syn_scan(host: str, ports: list[int], timeout: float = 1.0) -> list[SynResult]:
    """
    LUU Y: scapy khong an toan khi dung da luong true (khong thread-safe
    hoan toan voi socket layer 2), nen ban dau nen chay tuan tu. Neu can
    toc do, co the dung nhieu tien trinh (multiprocessing) thay vi thread.
    """
    if not SCAPY_AVAILABLE:
        raise RuntimeError(
            "Module nay can scapy. Chay: pip install scapy\n"
            "Va chay script voi quyen root/administrator (raw socket)."
        )
    results = [syn_scan_port(host, p, timeout) for p in ports]
    return sorted(results, key=lambda r: r.port)


if __name__ == "__main__":
    import sys
    import os

    if os.name != "nt" and os.geteuid() != 0:
        print("[!] SYN scan can quyen root. Chay lai voi: sudo python3 syn_scanner.py ...")
        sys.exit(1)

    if not SCAPY_AVAILABLE:
        print("[!] Chua cai scapy. Chay: pip install scapy")
        sys.exit(1)

    target = sys.argv[1] if len(sys.argv) > 1 else "127.0.0.1"
    port_list = [int(p) for p in sys.argv[2].split(",")] if len(sys.argv) > 2 else [22, 80, 443]

    print(f"[*] SYN scan {target} tren {len(port_list)} cong...")
    for r in syn_scan(target, port_list):
        print(f"    {r.port}/tcp\t{r.state}")
