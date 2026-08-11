# Tuần 5: Vulnerability Analysis (CEH v13 Module 05)

> Module CEH v13 tương ứng: **05 — Vulnerability Analysis**. Nội dung đã được chuẩn hóa sang Markdown.

## Mục Tiêu Tuần / Week Objectives

Bám sát nội dung **Module 05** trong giáo trình CEH v13. Kết thúc tuần, học viên:

1. Hiểu rõ **Vulnerability Assessment (VA)** là gì và phân biệt với **Penetration Test**.
2. Phân loại được các **loại vulnerability assessment** (active/passive, external/internal, host/network, authenticated/unauthenticated).
3. Đọc và diễn giải được **CVE – CVSS (v3/v4) – CWE – NVD – CISA KEV**, biết cách tính severity.
4. Nắm được **vòng đời quản lý lỗ hổng** (VA → Prioritize → Remediate → Verify) và các nguồn nghiên cứu lỗ hổng.
5. Sử dụng được công cụ **NVD API tra cứu CVE**, **Nmap vuln script**, **Nikto** **chỉ trong phạm vi pháp lý (localhost/VM)**.

---

## Lý Thuyết / Theory

### 1. Vulnerability Assessment là gì? Phân biệt với Penetration Test

- **Vulnerability Assessment (VA):** quá trình **quét & phát hiện** lỗ hổng trên hệ thống dựa trên cơ sở dữ liệu signature lớn, tạo **báo cáo rủi ro**.
- **Penetration Test:** đi xa hơn — **khai thác thực tế** lỗ hổng để chứng minh mức độ ảnh hưởng. Pen-test có thể *đứng trên vai* kết quả của VA.

| Tiêu chí | Vulnerability Assessment | Penetration Test |
|----------|--------------------------|------------------|
| Mục tiêu | Tìm ra lỗ hổng | Chứng minh lỗ hổng bị khai thác |
| Phương pháp | Quét tự động (signature-based) | Khai thác thủ công + công cụ |
| Độ xâm nhập | Thấp – Trung bình | Cao |
| Sản phẩm | Danh sách lỗ hổng + điểm CVSS | Chi tiết attack path + chứng cứ |
| Pháp lý | Cần phạm vi rõ (scoping) | **Bắt buộc** RoE / authorization |

### 2. Các Loại Vulnerability Assessment

| Phân loại | Giải thích |
|-----------|------------|
| **Active** vs **Passive** | Active: gửi packet để khảo sát (quét port, banner grabbing). Passive: chỉ nghe lưu lượng trên mạng, không đụng máy chủ |
| **External** vs **Internal** | External: quét từ bên ngoài như hacker tầm xa. Internal: quét từ trong mạng nội bộ (simulate insider / máy bị chiếm) |
| **Host** vs **Network** | Host-based: quét 1 máy (OS, service, patch level). Network-based: quét toàn bộ mạng, rà service |
| **Authenticated** vs **Unauthenticated** | Authenticated: có credentials → quét sâu, ít false-positive. Unauthenticated: như hacker ngoài, không có quyền truy cập |

### 3. Vulnerability Classification: CVSS, CVE, CWE, NVD, CISA KEV

- **CVE (Common Vulnerabilities and Exposures):** mã định danh duy nhất `CVE-YYYY-NNNNN` cho từng lỗ hổng cụ thể (cấp phát bởi MITRE / CNA).
- **CWE (Common Weakness Enumeration):** phân loại **loại lỗ hổng** chung (VD: CWE-89 SQL Injection, CWE-79 XSS) — một CWE có thể ứng với nhiều CVE.
- **NVD (National Vulnerability Database):** kho dữ liệu chuẩn hoá do NIST quản lý, gắn CVE với CVSS score, CPE, CWE.
- **CVSS (Common Vulnerability Scoring System):** thang điểm tiêu chuẩn đánh giá mức độ nghiêm trọng của CVE. Bản hiện hành **CVSS v3.1 / v4.0** (CEH v13 đề cập cả hai).
- **CISA KEV (Known Exploited Vulnerabilities):** danh sách các CVE **đã bị khai thác thực tế** ngoài đời — ưu tiên vá ngay.

### 4. CVSS Scoring: 3 component groups

| Nhóm | Ý nghĩa |
|------|---------|
| **Base Metrics** | Bản chất lỗ hổng: Attack Vector (AV), Attack Complexity (AC), Privileges Required (PR), User Interaction (UI), Scope (S), Confidentiality/Integrity/Availability impact (C/I/A) |
| **Environmental Metrics** | Môi trường riêng của bạn: thay đổi điểm theo mức độ quan trọng của asset (Modified Base Metrics, Confidentiality/Integrity/Availability Requirement) |
| **Temporal Metrics** | Thay đổi theo thời gian: Exploit Code Maturity (E), Remediation Level (RL), Report Confidence (RC) |

**Severity mapping (CVSS v3.1):**

| Điểm | Mức độ |
|------|--------|
| 9.0 – 10.0 | **Critical** |
| 7.0 – 8.9 | **High** |
| 4.0 – 6.9 | **Medium** |
| 0.1 – 3.9 | **Low** |
| 0.0 | **None** |

**Vector string ví dụ:** `CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H` → mạng từ xa, không cần quyền, không cần người dùng, ảnh hưởng trọn vẹn → **10.0 Critical**.

### 5. Vulnerability Research Sources

| Nguồn | Ứng dụng |
|-------|----------|
| **NVD (nvd.nist.gov)** | Tra cứu CVE chuẩn + CVSS score chính thức |
| **CVE.org** | Cổng MITRE cấp mã CVE |
| **Exploit-DB (exploitdb.com)** | Tìm proof-of-concept (PoC) / exploit mã nguồn mở |
| **Vulners (vulners.com)** | Tổng hợp nhiều nguồn bulletin, tìm theo CPE |
| **CISA KEV** | Cập nhật lỗ hổng đang bị khai thác thực tế |

### 6. Vulnerability Management Lifecycle

```
1. Vulnerability Assessment (quét & phát hiện)
        ↓
2. Prioritize    (xếp ưu tiên theo CVSS + KEV + giá trị asset)
        ↓
3. Remediate     (patch, cấu hình, workaround)
        ↓
4. Verify        (quét lại để chứng minh đã sạch)
        ↓
   (lặp lại - liên tục, không phải việc 1 lần)
```

### 7. Tools (tóm tắt)

| Công cụ | Vai trò |
|---------|---------|
| **OpenVAS / Greenbone** | Nền tảng VA mã nguồn mở, cơ sở dữ liệu NASL lớn |
| **Nessus** | VA scanner thương mại phổ biến nhất, có plugin CVE gắn CVSS |
| **Nmap `--script vuln`** | Quét port + chạy script phát hiện lỗ hổng (NSE) |
| **Nikto** | Quét lỗ hổng máy chủ web (config sai, file nguy hiểm) |
| **OWASP ZAP** | Proxy thao tác web app + scan lỗ hổng OWASP Top 10 |

### 8. Countermeasures

- **Patch Management:** vá lỗ hổng đúng hạn (90 ngày / 30 ngày với KEV) — quan trọng nhất.
- **Security Baselines:** cấu hình chuẩn, tắt dịch vụ không cần thiết, nguyên tắc least privilege.
- **Continuous Monitoring:** tái quét định kỳ, theo dõi CVE mới của phần mềm đang dùng, có kế hoạch backup.

---

## Cảnh Báo An Toàn & Đạo Đức / Safety & Ethics

> [!WARNING]
> 1. Toàn bộ thực hành tuần này **CHỈ chạy trên**: `127.0.0.1`, máy ảo Kali/Metasploitable của bạn, hoặc web server Python chạy ở localhost.
> 2. Quét/khai thác lỗ hổng trên hệ thống **không thuộc về bạn** (kể cả trang web ngẫu nhiên trên Internet) là **vi phạm pháp luật** — sẽ **FAIL toàn bộ khoá học**.
> 3. NVD API chỉ phục vụ **tra cứu dữ liệu công khai** để hiểu & vá lỗ hổng. Không dùng CVE/PoC tìm được để tấn công hệ thống khác.

---

## Thực Hành Code / Hands-On (Defensive-first)

### Lab 1: Tra cứu CVE bằng NVD API (Python) — File: `CODE/week05_cve_lookup.py`

Công cụ phòng thủ: gọi **NVD Public API** (nvd.nist.gov) tìm CVE theo từ khoá, in **CVE ID + CVSS score + severity**, tự xử lý **API key tuỳ chọn + rate limit**, có **banner đạo đức** (Tham khảo file code hoàn chỉnh trong `week05_code/week05_cve_lookup.py`).

```python
#!/usr/bin/env python3
# week05_cve_lookup.py - Tra cứu CVE qua NVD API (defensive research)
import argparse, json, os, sys, time, urllib.parse, urllib.request

NVD_API_URL = "https://services.nvd.nist.gov/rest/json/cves/2.0"
RATE_LIMIT_SLEEP = 6.0

def severity_from_score(score):
    if score >= 9.0: return "CRITICAL"
    if score >= 7.0: return "HIGH"
    if score >= 4.0: return "MEDIUM"
    if score > 0.0:  return "LOW"
    return "NONE"

def extract_cvss(cve_item):
    best = {"score": 0.0, "version": "", "severity": "NONE", "vector": ""}
    for key in ("cvssMetricV31", "cvssMetricV30"):
        for entry in cve_item.get("metrics", {}).get(key, []):
            c = entry.get("cvssData", {})
            if c.get("baseScore", 0) > best["score"]:
                best = {"score": c["baseScore"], "version": c.get("version", ""),
                        "severity": c.get("baseSeverity", "NONE"),
                        "vector": c.get("vectorString", "")}
    return best

def fetch_cves(url, api_key):
    req = urllib.request.Request(url)
    req.add_header("User-Agent", "week05-cve-lookup/1.0 (educational)")
    if api_key: req.add_header("apiKey", api_key)
    for attempt in range(1, 4):
        try:
            with urllib.request.urlopen(req, timeout=15) as resp:
                return json.loads(resp.read().decode("utf-8"))
        except urllib.error.HTTPError as e:
            if e.code in (403, 429):   # rate limit
                print(f"[!] Rate limit (HTTP {e.code}). Chờ {RATE_LIMIT_SLEEP}s...")
                time.sleep(RATE_LIMIT_SLEEP); continue
            print(f"[X] HTTP {e.code}: {e.reason}"); return None
        except Exception as e:
            print(f"[!] Lỗi mạng: {e}. Thử lại {attempt}/3..."); time.sleep(3)
    return None

def main():
    # Banner đạo đức (rút gọn — bản đầy đủ trong file week05_code/)
    print("=" * 60)
    print("CVE LOOKUP - NVD Public API (Tra cứu phòng thủ - Defensive)")
    print("[ETHICS] CHỈ tra cứu dữ liệu công khai. Không khai thác hệ thống lạ.")
    print("=" * 60)

    parser = argparse.ArgumentParser()
    parser.add_argument("keyword", nargs="?", default="Apache HTTP Server")
    parser.add_argument("--results", type=int, default=15)
    parser.add_argument("--api-key", default=os.environ.get("NVD_API_KEY"))
    args = parser.parse_args()

    params = urllib.parse.urlencode(
        {"keywordSearch": args.keyword, "resultsPerPage": args.results})
    data = fetch_cves(f"{NVD_API_URL}?{params}", args.api_key)
    if not data: sys.exit(1)

    rows = []
    for v in data.get("vulnerabilities", []):
        c = v.get("cve", {})
        if not c: continue
        cvss = extract_cvss(c)
        rows.append((c["id"], cvss["score"], cvss["severity"], cvss["version"]))

    rows.sort(key=lambda r: r[1], reverse=True)
    print(f"\nKết quả cho \"{args.keyword}\": {len(rows)} CVE")
    for cve_id, score, sev, ver in rows[:args.results]:
        print(f"  [{sev:^8}] {cve_id} | CVSS {ver} = {score:.1f}")
    print("[KHUYẾN NGHỊ] CVE Critical/High → ưu tiên patch ngay.")

if __name__ == "__main__":
    main()
```

**Chạy:**
```bash
# Không API key (rate limit 5 req/30s)
python3 week05_code/week05_cve_lookup.py OpenSSL
python3 week05_code/week05_cve_lookup.py "Apache 2.4.49" --results 10
# Có API key (đăng ký miễn phí tại NVD, tăng lên 50 req/30s)
export NVD_API_KEY="xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
python3 week05_code/week05_cve_lookup.py RCE --severity CRITICAL
```

### Lab 2: Máy tính CVSS base score + phân loại rủi ro (Python)

Tự tính **CVSS v3.1 Base Score** từ vector string (đúng công thức NIST/FIRST) **hoặc** phân loại severity từ điểm số — để hiểu rõ gốc rễ trước khi tin vào scanner.

```python
# vuln_risk_calculator.py - Tính CVSS v3.1 base score từ vector (defensive)
import math, sys

# Bảng giá trị chuẩn CVSS v3.1 (theo first.org/cvss)
AV = {"N": 0.85, "A": 0.62, "L": 0.55, "P": 0.2}
AC = {"L": 0.77, "H": 0.44}
UI = {"N": 0.85, "R": 0.62}
PR_SCOPE_UNCHANGED = {"N": 0.85, "L": 0.62, "H": 0.27}
PR_SCOPE_CHANGED   = {"N": 0.85, "L": 0.68, "H": 0.5}
CIA = {"H": 0.56, "L": 0.22, "N": 0.0}

def roundup(x):
    """Làm tròn LÊN đến 1 chữ số sau dấu phẩy (CVSS spec)."""
    return int(math.ceil(x * 10)) / 10.0

def parse_vector(vector):
    metrics = {}
    for pair in vector.replace("CVSS:3.1/", "").split("/"):
        if ":" in pair:
            k, v = pair.split(":")
            metrics[k] = v
    return metrics

def cvss_base_score(vector):
    m = parse_vector(vector)
    scope = m.get("S", "U")
    pr = PR_SCOPE_UNCHANGED if scope == "U" else PR_SCOPE_CHANGED

    iss = 1 - ((1 - CIA[m.get("C", "N")]) *
               (1 - CIA[m.get("I", "N")]) * (1 - CIA[m.get("A", "N")]))

    if scope == "U":
        impact = 6.42 * iss
    else:
        impact = 7.52 * (iss - 0.029) - 3.25 * (iss - 0.02) ** 15

    exploitability = (8.22 * AV[m.get("AV", "N")] * AC[m.get("AC", "H")] *
                      pr[m.get("PR", "N")] * UI[m.get("UI", "N")])

    base = impact + exploitability
    score = roundup(min(base if scope == "U" else 1.08 * base, 10.0))
    return score

def severity(score):
    if score >= 9.0: return "CRITICAL - Xử lý NGAY trong 0-7 ngày"
    if score >= 7.0: return "HIGH - Xử lý trong 7-30 ngày"
    if score >= 4.0: return "MEDIUM - Lên kế hoạch bảo trì"
    if score > 0.0:  return "LOW - Theo dõi định kỳ"
    return "NONE - Không rủi ro"

if __name__ == "__main__":
    if len(sys.argv) > 1:
        vector = sys.argv[1]
    else:
        vector = "CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H"
    s = cvss_base_score(vector)
    print(f"Vector : {vector}")
    print(f"Điểm   : {s:.1f} / 10.0")
    print(f"Mức độ : {severity(s)}")
```

**Chạy:**
```bash
python3 week05_code/vuln_risk_calculator.py "CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H"
python3 week05_code/vuln_risk_calculator.py "CVSS:3.1/AV:L/AC:H/PR:H/UI:R/S:C/C:L/I:L/A:N"
```

**Thử thách:** vector đầu tiên (đầy đủ quyền truy cập từ xa) → 10.0 Critical; vector thứ hai (cần quyền cao, tương tác người dùng) → thấp hơn nhiều.

### Lab 3: Quét lỗ hổng CỤC BỘ — Nmap `--script vuln` + Nikto

**CHỈ chạy trên `127.0.0.1`. Không quét IP/máy khác.**

```bash
# Bước 1: khởi động web server test TẠI ĐỊA PHƯƠNG (localhost)
mkdir -p ~/lab05 && cd ~/lab05
echo "Vulnerability Lab - CEH Week 05" > index.html
python3 -m http.server 8000 &
# -> Server chạy tại http://127.0.0.1:8000

# Bước 2: kiểm tra qét port thông thường trước (không có vuln script)
nmap -sV -p 8000 127.0.0.1

# Bước 3: chạy vulnerability scripts của Nmap trên localhost
# Script bản địa hóa: nếu mysql/rdp mở sẽ thử CVE tương ứng
nmap --script vuln 127.0.0.1

# Bước 4: quét lỗ hổng web server bằng Nikto (localhost)
nikto -h http://127.0.0.1:8000

# Dọn dẹp: tắt server (nhớ ghi lại PID)
kill %1
```

**Ý nghĩa:** Nmap `--script vuln` gọi họ NSE script (vd `http-vuln-*`, `smb-vuln-*`) để so khớp máy chủ với CVE đã biết; Nikto rà các file/config nguy hiểm thường gặp của web server. Cả hai đều **an toàn vì chủ đích localhost**.

---

## Bài Tập Về Nhà / Homework

1. **Tra CVE mới nhất** qua NVD API (dùng `week05_cve_lookup.py`): chọn 1 phần mềm bạn đang dùng (OpenSSL, nginx, Windows…), tìm 3 CVE có điểm cao nhất, **phân tích vector CVSS** (ý nghĩa từng metric AV/AC/PR/UI/S) và ghi lại bản sao bằng `nvd_report_*.json`.
2. **Thực hành Lab 3**: chạy `nmap --script vuln 127.0.0.1` và `nikto -h http://127.0.0.1:8000`, đối chiếu kết quả 2 công cụ, chụp ảnh màn hình, giải thích sự khác nhau giữa host-based scan và web scan.
3. **Tóm tắt 15 dòng** về *Vulnerability Management Lifecycle* trong Module 05: các bước VA → Prioritize → Remediate → Verify, và vai trò của **CISA KEV** trong việc xếp ưu tiên vá lỗ hổng.

---

## Rubric Đánh Giá Tuần 5

| Tiêu chí | Xuất sắc (90-100%) | Khá (70-89%) | Yếu (<70%) |
|----------|--------------------|--------------|------------|
| **Phân tích CVE/CVSS** | Tra cứu đúng 3 CVE, giải thích được ý nghĩa vector + severity (40đ) | Tra cứu đúng CVE nhưng phân tích vector sơ sài (25đ) | Không dùng được NVD API / chép lại không hiểu (10đ) |
| **Thực hành local scan** | Chạy đúng Nmap + Nikto trên 127.0.0.1, đối chiếu kết quả (30đ) | Chạy được 1 trong 2 công cụ (20đ) | Quét hệ thống không thuộc quyền / không chạy được (5đ) |
| **Tóm tắt VM lifecycle** | Nêu đúng 4 bước + vai trò KEV, liên hệ ưu tiên patch (30đ) | Nêu đúng các bước nhưng thiếu vai trò KEV (20đ) | Chép lại không hiểu (5đ) |

---

## Checklist Đầu Ra Tuần 5

- [ ] Phân biệt được Vulnerability Assessment và Penetration Test
- [ ] Liệt kê được 4 cặp loại VA (active/passive, external/internal, host/network, auth/unauth)
- [ ] Đọc được vector CVSS v3.1 và phân loại severity (Critical/High/Medium/Low/None)
- [ ] Hiểu vai trò của CVE, CWE, NVD, CISA KEV trong quản lý lỗ hổng
- [ ] Chạy thành công `week05_cve_lookup.py` và `vuln_risk_calculator.py`
- [ ] Chạy `nmap --script vuln` + Nikto trên `127.0.0.1` không vi phạm phạm vi pháp lý