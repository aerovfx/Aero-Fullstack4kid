#!/usr/bin/env python3
# week05_cve_lookup.py
# CVE Lookup Tool - Tra cứu lỗ hổng từ NVD Public API (Research / Blue Team)
# Tuần 5 - CEH v13 Module 05 | Vulnerability Analysis
# Chỉ truy cập dữ liệu công khai. KHÔNG khai thác / KHÔNG quét hệ thống lạ.

import argparse
import json
import os
import sys
import time
import urllib.error
import urllib.parse
import urllib.request
from datetime import datetime

# ----------------------------- ETHICS BANNER -----------------------------
BANNER = r"""
======================================================================
  CVE LOOKUP TOOL - Tra cuu CVE qua NVD (National Vulnerability Database)
  Tuan 5 - CEH v13 Module 05 | Vulnerability Analysis (Defensive)
======================================================================
  [ETHICS / DAO DUC]
   1. Cong cu CHI phuc vu nghien cuu - phong thu hop phap.
   2. Du lieu cau hoi la API CONG KHAI cua NVD (nvd.nist.gov).
   3. Khong dung thong tin tim duoc de khai thac he thong khong thuoc
      quyen so huu cua ban. Vi pham la ILLEGAL theo Luat ATTT mang VN.
   4. Muc tieu: hieu CVE + CVSS de UU TIEN PATCH - khong phai de danh.
======================================================================
"""

# Dinh nghia diem API cua NVD (chinh thuc tu nvd.nist.gov/developers)
NVD_API_URL = "https://services.nvd.nist.gov/rest/json/cves/2.0"

# Rate limit cua NVD: khong the tra 403 neu goi qua han
#   - khong co API key : 5 request / 30 giay
#   - co API key      : 50 request / 30 giay (mien phi dang ky tai NVD)
RATE_LIMIT_SLEEP = 6.0          # khong key -> chuan bi 5 req/30s
RATE_LIMIT_SLEEP_KEYED = 0.7    # co key   -> du thoai mai hon

SEVERITY_ORDER = ["CRITICAL", "HIGH", "MEDIUM", "LOW", "NONE"]


def severity_from_score(score):
    """Phan loai muc do tu diem CVSS (theo chuan FIRST/CVSS v3.1)."""
    if score >= 9.0:
        return "CRITICAL"
    if score >= 7.0:
        return "HIGH"
    if score >= 4.0:
        return "MEDIUM"
    if score > 0.0:
        return "LOW"
    return "NONE"


def extract_cvss(cve_item):
    """Rut diem CVSS cao nhat (u tien v3.1 > v3.0 > v2)."""
    metrics = cve_item.get("metrics", {})
    best = {"score": 0.0, "version": "", "severity": "NONE", "vector": ""}
    for key in ("cvssMetricV31", "cvssMetricV30"):
        for entry in metrics.get(key, []):
            c = entry.get("cvssData", {})
            score = c.get("baseScore", 0.0)
            if score > best["score"]:
                best = {
                    "score": score,
                    "version": c.get("version", ""),
                    "severity": c.get("baseSeverity", severity_from_score(score)),
                    "vector": c.get("vectorString", ""),
                }
    for entry in metrics.get("cvssMetricV2", []):
        c = entry.get("cvssData", {}).get("baseScore", 0.0)
        if c > best["score"]:
            best = {
                "score": c,
                "version": "2.0",
                "severity": severity_from_score(c),
                "vector": entry.get("cvssData", {}).get("vectorString", ""),
            }
    return best


def build_request_url(keyword, results_per_page, severity_filter):
    """Dung urllib (stdlib) de goi NVD 2.0 API - khong can thu vien ngoai."""
    params = {
        "keywordSearch": keyword,
        "resultsPerPage": str(results_per_page),
    }
    if severity_filter:  # NVD API ho tro loc san theo muc do
        params["cvssV3Severity"] = severity_filter
    endpoint = f"{NVD_API_URL}?{urllib.parse.urlencode(params)}"
    return endpoint


def fetch_cves(url, api_key):
    """Goi API NVD kem retry + xu ly rate limit (HTTP 403 / 429)."""
    headers = {"User-Agent": "week05-cve-lookup/1.0 (educational)"}
    if api_key:
        headers["apiKey"] = api_key
    req = urllib.request.Request(url, headers=headers)

    for attempt in range(1, 4):  # toi da 3 lan thu
        try:
            with urllib.request.urlopen(req, timeout=15) as resp:
                return json.loads(resp.read().decode("utf-8"))
        except urllib.error.HTTPError as e:
            if e.code in (403, 429):
                print(f"[!] Bi gioi han toc do (HTTP {e.code}). Cho {RATE_LIMIT_SLEEP}s...")
                time.sleep(RATE_LIMIT_SLEEP)
                continue  # thu lai sau khi ngu
            print(f"[X] Loi HTTP {e.code}: {e.reason}")
            return None
        except (urllib.error.URLError, TimeoutError) as e:
            print(f"[!] Loi mang: {e}. Thu lai ({attempt}/3)...")
            time.sleep(3)
    print("[X] Het so lan thu. Kiem tra mang / giam tan suat goi API.")
    return None


def print_report(cve_items, keyword):
    """In danh sach CVE + CVSS + severity ra console."""
    print("-" * 90)
    print(f"KET QUA tra cuu keyword: \"{keyword}\"  ({len(cve_items)} CVE)")
    print("-" * 90)
    if not cve_items:
        print("[.] Khong tim thay CVE nao. Thu tu khoa khac.")
        return

    rows = []
    for item in cve_items:
        cve_id = item.get("cve", {}).get("id", "???")
        desc = item.get("cve", {}).get("descriptions", [])
        text = ""
        for d in desc:
            if d.get("lang") == "en":
                text = d.get("value", "")
                break
        published = item.get("published", "")[:10]
        cvss = extract_cvss(item)
        rows.append((cve_id, cvss["score"], cvss["severity"],
                     cvss["version"], published, text))

    # Sap xep: CVE diem cao dock len dau
    rows.sort(key=lambda r: r[1], reverse=True)

    for cve_id, score, sev, version, published, text in rows:
        print(f"  [{sev:^8}] {cve_id}  | CVSS {version} = {score:.1f}  | {published}")
        brief = text[:160] + ("..." if len(text) > 160 else "")
        print(f"            -> {brief}")

    # Tinh nhanh: bao nhieu CVE cao nghiem de uu tien patch
    critical = sum(1 for r in rows if r[2] == "CRITICAL")
    high = sum(1 for r in rows if r[2] == "HIGH")
    print("-" * 90)
    print(f"[KHUYEN NGHI] {critical} CRITICAL + {high} HIGH -> uu tien patch truoc.")


def main():
    parser = argparse.ArgumentParser(
        description="Tra cuu CVE tren NVD - CEH Module 05 (defensive research).")
    parser.add_argument("keyword", nargs="?", default="Apache HTTP Server",
                        help="Tu khoa tim kiem (VD: 'OpenSSL', 'Apache 2.4.49')")
    parser.add_argument("--results", type=int, default=15,
                        help="So CVE toi da hien thi (mac dinh 15)")
    parser.add_argument("--severity", choices=SEVERITY_ORDER,
                        help="Loc theo CVSS v3 severity (NVD side)")
    parser.add_argument("--api-key", help="NVD API key (mien phi) - hoac dat "
                                          "bien moi truong NVD_API_KEY")
    args = parser.parse_args()

    print(BANNER)

    # API key OPTIONAL: lay tu bien moi truong neu nguoi dung khong truyen
    api_key = args.api_key or os.environ.get("NVD_API_KEY", "")
    if api_key:
        print("[+] Da su dung NVD API key -> rate limit 50 req/30s")
    else:
        print("[.] Chua co API key -> dung gioi han cong khai 5 req/30s")
    print(f"[*] Trang van ban tra cuu: {args.keyword}")

    url = build_request_url(args.keyword, args.results, args.severity)
    data = fetch_cves(url, api_key)
    if data is None:
        sys.exit(1)

    vulns = data.get("vulnerabilities", [])
    cve_items = [v.get("cve", {}) for v in vulns if v.get("cve")]
    print_report(cve_items, args.keyword)

    # Luu ket qua ra JSON de phuc vu ban bao cao
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    out_file = f"nvd_report_{timestamp}.json"
    with open(out_file, "w", encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=False, indent=2)
    print(f"[+] Da luu du lieu raw: {out_file}")
    print("[+] Nho: du lieu nay CHI h~ dung cho phan tich ru ro - patch!")


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print("\n[!] Nguoi dung huy. Thoat an toan.")
        sys.exit(130)