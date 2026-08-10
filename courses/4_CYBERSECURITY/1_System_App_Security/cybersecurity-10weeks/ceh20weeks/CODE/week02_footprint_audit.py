#!/usr/bin/env python3
# footprint_audit.py
# FOOTPRINT AUDIT - Tu kiem tra thong tin cong khai cua CHINH domain cua ban
# Phong thu (BLUE TEAM): xem "ke dich" thay gi ve minh de dong lo truoc.
# Tuan 2 - CEH Module 02 (Footprinting and Reconnaissance).
#
# [ETIKA - DOC TRUOC KHI CHAY]
#   Chi duoc chay len domain BAN TOAN QUYEN SO HUU, hoac domain giao duc
#   example.com / example.org / test.com.
#   Chay len domain cua nguoi khac (CBD query DNS/WHOIS) = active footprinting
#   bat hop phap, vi pham Luat An toan thong tin mang 2015 & ND 06/2022/ND-CP.
import socket
import json
import datetime
import subprocess
import sys

TARGET_DOMAIN = "example.com"  # <-- THAY bang domain cua BAN (tu dang ky)
AUTHORIZED = False  # <-- dat True sau khi ban XAC NHAN quyen so huu domain

# ============================ BAO VE NGUOI DUNG ============================
if not AUTHORIZED:
    print("[!] AUTHORIZED=False: chay o che do GIAO DUC (example.com / test.com).")
    print("[!] Muon quet domain that cua ban: sua bien AUTHORIZED = True.")
    TARGET_DOMAIN = "example.com"


def run_cmd(cmd, timeout=15):
    """Chay lenh he thong (nslookup/whois/dig) co xu ly loi."""
    try:
        out = subprocess.run(
            cmd, shell=True, capture_output=True, text=True, timeout=timeout
        )
        return (out.stdout or out.stderr).strip()
    except subprocess.TimeoutExpired:
        return "[ERROR] Timeout khi chay lenh"
    except Exception as e:  # noqa: BLE001
        return f"[ERROR] {e}"


def get_a_record(domain):
    """A record (IP cong khai) qua socket."""
    try:
        return socket.gethostbyname(domain)
    except socket.gaierror:
        return None
    except Exception as e:  # noqa: BLE001
        return f"[ERROR] {e}"


def dns_records(domain):
    """Lay MX, NS, TXT records qua nslookup (khong can cai dnspython)."""
    recs = {}  # type, raw_text
    for rtype in ("mx", "ns", "txt", "soa"):
        out = run_cmd(f"nslookup -type={rtype} {domain}")
        if out and "[ERROR]" not in out:
            recs[rtype] = out
            print(f"[DNS] {rtype.upper()}: luu {len(out)} dong -> xem JSON")
    return recs


def whois_lookup(domain):
    """WHOIS - thong tin dang ky ten mien (con tray neu CLi co san)."""
    whois_bin = run_cmd("command -v whois")
    if whois_bin == "":
        return "[SKIP] whois CLI khong co. Cai: brew install whois"
    out = run_cmd(f"whois {domain}")
    if not out:
        return "[SKIP] Khong co du lieu WHOIS tra ve"
    # Chi giu 20 dong dau (dau hieu "ke dich" doc ngay)
    return "\n".join(out.splitlines()[:20])


def main():
    print("=" * 60)
    print("FOOTPRINT AUDIT - Tu kiem tra dau chan cong khai")
    print(f"Domain: {TARGET_DOMAIN}")
    print(f"Thoi gian: {datetime.datetime.now():%Y-%m-%d %H:%M}")
    print("=" * 60)

    report = {
        "domain": TARGET_DOMAIN,
        "audit_type": "BLUE_TEAM_SELF_ASSESSMENT",
        "scanned_at": str(datetime.datetime.now()),
        "authorized": AUTHORIZED,
    }

    # 1) A record
    ip = get_a_record(TARGET_DOMAIN)
    report["a_record"] = ip
    if ip:
        print(f"[A] IP cong khai: {ip}")
    else:
        print("[A] Khong phan giai duoc IP (domain ko ton tai / offline).")

    # 2) DNS records
    print("[DNS] Dang thu thap MX/NS/TXT/SOA ...")
    report["dns"] = dns_records(TARGET_DOMAIN)

    # 3) WHOIS
    print("[WHOIS] Dang tra cuu thong tin dang ky ...")
    report["whois_head"] = whois_lookup(TARGET_DOMAIN)

    # 4) Du doan ru ro va khuyen nghi (BLUE TEAM)
    findings = []
    if isinstance(ip, str) and ip:
        findings.append(
            "- A record lon: han che bang cach tang CDN/WAF neu can giau IP goc."
        )
    mx = report["dns"].get("mx", "")
    if "mail exchanger" in mx.lower() or "mail" in mx.lower():
        findings.append(
            "- MX record lon: lat mat mail server -> dung mail relay / strict SPF "
            "de giam spam an len ban."
        )
    report["recommendations"] = (
        findings
        if findings
        else ["- Khong phat hien danh dau lan nhau: van nen chay lai hang tuan."]
    )

    # 5) Xuat bao cao JSON
    out_name = "footprint_report.json"
    with open(out_name, "w", encoding="utf-8") as f:
        json.dump(report, f, ensure_ascii=False, indent=2)
    print("-" * 60)
    print(f"[KET QUA] {len(findings)} khuyen nghi de dong dau chan OSINT.")
    print(f"[+] Da xuat bao cao: {out_name}")
    print("[+][ETIKA] Chi dung ket qua cho CHINH domain minh. Khong phan tan.")


if __name__ == "__main__":
    main()