# Tuần 2: Footprinting and Reconnaissance (CEH v13 Module 02)

> Module CEH v13 tương ứng: **02 — Footprinting and Reconnaissance**. Nội dung đã được chuẩn hóa sang Markdown.

## Mục Tiêu Tuần / Week Objectives

Bám sát nội dung **Module 02** trong giáo trình CEH v13. Kết thúc tuần, học viên:

1. Hiểu rõ **khái niệm Footprinting** — giai đoạn **đầu tiên của 5 pha tấn công** — và mục tiêu của nó: thu thập tối đa thông tin công khai (OSINT) về tổ chức/hệ thống mục tiêu.
2. Phân biệt được **Passive Footprinting** (Google, social media, Wayback — không đụng trực tiếp vào hệ thống) và **Active Footprinting** (whois, DNS queries, nslookup/dig — có tương tác, có để lại dấu vết).
3. Sử dụng thành thạo các kỹ thuật **OSINT thu thập**: WHOIS, DNS (nslookup/dig), subdomain enumeration, Google Hacking (Google Dorks), social media, Wayback Machine.
4. Biết khởi chạy và đọc hiểu output của bộ công cụ: **theHarvester, Maltego, Shodan, Google Dorks**.
5. Nêu được các **Countermeasures (biện pháp phòng thủ)**: chính sách bảo mật thông tin, WHOIS privacy, che giấu DNS records, giảm bề mặt OSINT.

---

## Lý Thuyết / Theory

### 1. Footprinting Là Gì?

**Footprinting** (còn gọi là *reconnaissance* / *information gathering*) là quá trình **thu thập thông tin công khai và hợp pháp** về mục tiêu trước khi tiến hành bất kỳ cuộc tấn công nào. Đây là **Pha 1 trong 5 pha tấn công** của CEH (xem lại sơ đồ Tuần 1).

**Mục tiêu của footprinting:**
- Xác định **bề mặt tấn công (attack surface)**: domain, IP, cổng, công nghệ đang dùng.
- Thu thập **thông tin định danh**: tên, email, số điện thoại, địa chỉ của nhân sự (dùng cho social engineering).
- Tìm ra **email server, DNS server, network blocks, Web server technologies**.
- Giảm **xác suất bị phát hiện**: hiểu rõ môi trường trước khi "chạm" vào hệ thống.

> **Nguyên tắc vàng:** Càng footprint kỹ, giai đoạn scanning (W3/4) và khai thác (W6) càng chính xác và khó bị phát hiện.

### 2. Passive vs Active Footprinting

| Tiêu chí | **Passive Footprinting** | **Active Footprinting** |
|----------|--------------------------|-------------------------|
| *Định nghĩa* | Thu thập thông tin **mà không đụng trực tiếp** vào hệ thống mục tiêu | **Tương tác trực tiếp** với hệ thống mục tiêu |
| *Kỹ thuật điển hình* | Google/search engine, social media, Wayback Machine, công cụ XSSed/hồ sơ công khai | WHOIS lookup, DNS queries (nslookup/dig), pinging, banner grabbing |
| *Pháp lý & rủi ro* | Dùng thông tin công khai — rủi ro pháp lý thấp | Có tương tác, để lại log — rủi ro bị phát hiện cao hơn |
| *Đúng "đụng" mục tiêu?* | Không | Có (DNS queries, TCP connections) |

> Lưu ý: Theo CEH v13, WHOIS và DNS queries được xếp vào **active footprinting** vì chúng gửi request đến server của bên thứ ba — dù dữ liệu trả về là công khai.

### 3. OSINT Thu Thập (OSINT = Open Source Intelligence)

**OSINT** là thông tin **thu được từ nguồn công khai**, hợp pháp — mất mạng và miễn phí. Là xương sống của both passive & active footprinting.

**Các nguồn OSINT điển hình trong Module 02:**

#### a) WHOIS — "CMND" của tên miền
- Registry lưu: **registrant** (người đăng ký), **registrar** (nhà quản lý tên miền như GoDaddy/Mat Bao), **name servers**, **registration & expiry date**.
- **Công cụ:** `whois example.com` (CLI), [whois.icann.org](https://whois.icann.org), website của registrar.
- Giá trị tấn công: tìm **email/điện thoại** của người đăng ký → nguồn nuôi social engineering.

#### b) DNS (nslookup / dig)
DNS là "danh bạ điện thoại" của Internet. Tra cứu DNS **không cần phép** nhưng để lại dấu vết trên authoritative server của mục tiêu.

```bash
nslookup -type=any example.com     # tất cả records
nslookup -type=mx example.com      # mail server (đọc ra: gã "muối" spam mất mạng nếu expose)
nslookup -type=ns example.com      # name server
dig example.com ANY @8.8.8.8       # query trực tiếp tới resolver công khai
```

#### c) Subdomain Enumeration
Tên miền con thường **ít bảo mật hơn tên miền chính** và lộ công nghệ nội bộ (`dev.`, `staging.`, `test.`, `vpn.`, `mail.`).

```bash
# Brute-force từ wordlist
python3 /usr/share/dnsenum/dnsenum.pl --enum example.com -f /usr/share/wordlists/subdomains-top1million.txt
dig -t AXFR example.com @ns1.example.com   # zone transfer (thường bị chặn)
```

#### d) Google Hacking (Google Dorks)
Dùng câu lệnh đặc biệt của Google để lọc kết quả, lộ file "lỡ công khai":

```
site:example.com                            # toàn bộ domain của target
site:example.com filetype:xlsx              # file Excel lộ data
intitle:"index of" "admin" site:example.com # thư mục mở (open directory)
inurl:php?id= site:example.com              # tìm tham số dễ injection
filetype:sql site:example.com password      # file sql lộ mật khẩu
```

#### e) Social Media (Recon người — Human Recon)
- LinkedIn: tên nhân viên, vị trí, công nghệ công ty dùng.
- Facebook/Twitter/TikTok: thói quen, avatar (câu hỏi bảo mật), bóng bẩy chính trị.
- GitHub: code bị push nhầm, **API key / .env bị lộ** (kho báu của attacker).
- Kỹ thuật đi kèm: **search site:github.com "domain" password**, công cụ **Scythe / CrossLinked**.

#### f) Wayback Machine
Kho lưu trữ snapshot toàn bộ website: tìm **dữ liệu bị xoá**, phiên bản cũ cài phần mềm lỗ hoá, link API cũ vẫn còn sống.

```
https://web.archive.org/web/*/example.com
```

### 4. Công Cụ Footprinting (Toolkit)

| Công cụ | Loại | Dùng để làm gì |
|---------|------|----------------|
| **theHarvester** | Active/Passive | Gom **email, hostname, IP** từ Google, Bing, LinkedIn, PGP server... |
| **Maltego** | Passive (GUI) | **Graph OSINT**: vẽ bản đồ quan hệ domain-email-người dùng có thể export sang máy vẽ bản đồ |
| **Google Dorks** | Passive | Lọc GOOGLED kết quả tìm kiếm để lộ file/nội dung nhạy cảm |
| **Shodan** | Active tiếp xúc | Máy quét **IoT**: tìm thiết bị lộ cổng trên toàn Internet ('exploitable' banner, nhà máy bắn, router lỗ) |
| **nslookup / dig** | Active | Tra cứu DNS records |
| **whois** | Active (nhẹ) | Tra thông tin đăng ký tên miền/IP block |
| **sublist3r** | Passive/Active | Subdomain enumeration |
| **waybackpy** | Passive | Pull lịch sử snapshot Wayback |

> ⚠️ **Quan trọng pháp lý:** Shodan/DNS queries gửi request **từ IP của bạn** — nếu bạn query IP/thiết bị **không thuộc quyền sở hữu**, bạn đang **probe từ xa** một hệ thống người khác. Chỉ tiếp xúc mục tiêu là **đối tác đã ký RoE**.

### 5. Countermeasures (Phòng Thủ — Góc Độ BLUE TEAM)

Mục tiêu: **giảm dấu chân kỹ thuật số (digital footprint)**.

1. **Chính sách bảo mật thông tin (Privacy Policy):** công bố rõ thông tin nào công khai, cấm nhân viên đăng công nghệ nội bộ lên mạng xã hội.
2. **WHOIS Privacy / Proxy:** che thông tin cá nhân ở registry (hoặc chọn registrar có domain privacy miễn phí).
3. **Ẩn DNS records:** dùng **DNSSEC** chống spoof, **tắt zone transfer** (chỉ cho phép từ IP của secondary NS), **tách biệt mail/dev/NS** — không đăng ký tên miền con dễ đoán.
4. **Ẩn công nghệ nền:** sửa server banner, đổi đường dẫn admin mặc định — attacker footprint ra được "mặt nạ" giống nhau mọi server.
5. **Kiểm soát thông tin nhân sự:** hướng dẫn cài đặt privacy trên LinkedIn/social; thu hồi tài khoản cũ; rà GitHub cho credential bị leak (trr `truffleHog`).
6. **Giám sát dấu chân của chính mình:** định kỳ tự query như attacker (chính kỹ thuật Lab 1) để phát hiện gì đang lộ trước khi kẻ xấu dùng.

---

## Cảnh Báo An Toàn & Đạo Đức / Safety & Ethics

> [!WARNING]
> 1. Footprinting là pha **ít rủi ro nhất** nhưng **KHÔNG phải không rủi ro**: query DNS/WHOIS/HTTP vàom ục tiêu BTC/Người thật là **hành vi phạm pháp** dù chỉ "xem thôi".
> 2. Toàn bộ thực hành tuần này **CHỈ được chạy** trên: **domain chính bạn đăng ký**, domain **của công ty bạn** (kèm Authorization Letter), hoặc các tên miền ví dụ giáo dục như `example.com`, `example.org`, `test.com`.
> 3. **Tuyệt đối cấm** chạy dork/thu thập OSINT nhắm vào **cá nhân người thật** (tìm email, số điện thoại, địa chỉ nhà của người khác) — đó là social engineering recon vào người, **FAIL toàn bộ khoá học** và có thể bị khởi tố theo Luật An toàn thông tin mạng 2015 & Nghị định 06/2022/NĐ-CP.

---

## Thực Hành Code / Hands-On (Defensive-first)

> Mọi lab dưới đây là **bài tự kiểm tra chính mình (self-assessment)** — bạn đứng ở vai trò BLUE TEAM quét dấu chân công khai của **chính domain mình** để đóng các lỗ đang lộ ra SaaS/OSINT cho kẻ xấu.

### Lab 1: `footprint_audit.py` — Tự kiểm tra dấu chân công khai của domain (Python)

Tool phòng thủ: dùng `socket.gethostbyname`, `nslookup` (hoặc `dnspython` nếu cài), và `whois` CLI — tổng hợp thành **báo cáo JSON** để bạn xem "kẻ địch thấy gì về mình".

File đầy đủ nằm tại: `CODE/week02_footprint_audit.py` (chạy được ngay).

```python
# CODE/week02_footprint_audit.py
# FOOTPRINT AUDIT — tự kiểm tra thông tin công khai của CHÍNH domain bạn
#
# [ETIKA] Chỉ dùng domain BẠN TOÀN QUYỀN SỞ HỮU hoặc domain giáo dục example.com
#         Chạy lên domain của người khác = footprinting bất hợp pháp.
import socket
import json
import datetime
import subprocess

TARGET_DOMAIN = "example.com"   # <-- THAY bằng domain của BẠN

def run_cmd(cmd):
    try:
        out = subprocess.run(cmd, shell=True, capture_output=True,
                             text=True, timeout=15)
        return out.stdout.strip() or out.stderr.strip()
    except Exception as e:
        return f"[ERROR] {e}"

print("=" * 60)
print("FOOTPRINT AUDIT - Tự kiểm tra dấu chân công khai")
print(f"Domain: {TARGET_DOMAIN}  |  {datetime.datetime.now():%Y-%m-%d %H:%M}")
print("=" * 60)

report = {"domain": TARGET_DOMAIN,
          "scanned_at": str(datetime.datetime.now())}

# 1) A record — IP công khai
try:
    ip = socket.gethostbyname(TARGET_DOMAIN)
    report["a_record"] = ip
    print(f"[A] IP công khai: {ip}")
except socket.gaierror:
    report["a_record"] = None
    print("[A] Không phân giải được IP.")

# 2) DNS records qua nslookup
dns_out = run_cmd(f"nslookup -type=any {TARGET_DOMAIN}")
report["nslookup_any"] = dns_out
print("[DNS] Kết quả nslookup -> xem báo cáo JSON")

# 2b) Chi tiết từng loại record (MX / NS / TXT / SOA)
for rtype in ("mx", "ns", "txt"):
    rec = run_cmd(f"nslookup -type={rtype} {TARGET_DOMAIN}")
    report[f"nslookup_{rtype}"] = rec
    print(f"[DNS] {rtype.upper()}: lưu {len(rec)} dòng -> xem JSON")

# 3) WHOIS — thông tin đăng ký (nếu có whois CLI)
whois_out = run_cmd(f"whois {TARGET_DOMAIN}")
report["whois_raw_head"] = "\n".join(whois_out.splitlines()[:15])

with open("footprint_report.json", "w", encoding="utf-8") as f:
    json.dump(report, f, ensure_ascii=False, indent=2)
print("[+] Đã xuất báo cáo: footprint_report.json")
```

**Chạy:**
```bash
python3 CODE/week02_footprint_audit.py
```

> 💡 Mẹo: thay `TARGET_DOMAIN` bằng **domain thật mà bạn sở hữu** (ví dụ domain học viên tự đăng ký theo yêu cầu rubric). Nếu chưa có domain, dùng `example.com` thuần giáo dục.

### Lab 2: `google_dorks_scanner.py` — Mô phỏng Google Hacking (giáo dục)

Tool mô phỏng **không thực sự query Google** — chỉ in ra danh sách câu `dork` mẫu và giải thích ý nghĩa phòng thủ, để học viên học thuộc *cú pháp* mà không đụng tới mạng ngoài.

```python
# CODE/week02_google_dorks_scanner.py
# GOOGLE DORKS SCANNER (SIMULATOR) — chỉ IN CÚ PHÁP, không query Google
#
# [ETIKA] Đây là mô phỏng GIÁO DỤC. Chạy raw dork lên domain người khác
#         qua Google (vd: dork mật khẩu) có thể vi phạm điều khoản + pháp luật.
import json

FRAME = "example.com"   # domain giáo dục — thay bằng domain BẠN sở hữu

DORKS = [
    {"query": f"site:{FRAME}",
     "purpose": "Liet ke toan bo trang do Google index - ban than mat dau chan cong khai",
     "defense": "Dung robots.txt, the noindex cho cac trang noi bo, xoa du lieu cu"},
    {"query": f"site:{FRAME} filetype:xlsx OR filetype:xls",
     "purpose": "Tim file Excel lo du lieu khach hang",
     "defense": "Khoi scan type file nhay cam khoi thu muc public, phan quyen doc"},
    {"query": f'site:{FRAME} inurl:admin OR inurl:login',
     "purpose": "Tim cong dang nhap quan tri",
     "defense": "Doi duong dan admin mac dinh, them IP whitelist"},
    {"query": f'site:{FRAME} intitle:"index of"',
     "purpose": "Tim thu muc mo (open directory) lo file",
     "defense": "Tat directory listing tren Apache/Nginx"},
    {"query": f'site:github.com "{FRAME}" password OR token OR api_key',
     "purpose": "Tim credential bi push nham len GitHub",
     "defense": "Quet repo bang truffleHog, thu hoi secret ngay"},
]

print("=" * 60)
print("GOOGLE DORKS SIMULATOR (educational only)")
print(f"Frame domain: {FRAME}")
print("=" * 60)

result = []
for i, d in enumerate(DORKS, 1):
    print(f"\n{i}. QUERY: {d['query']}")
    print(f"   Muc dich: {d['purpose']}")
    print(f"   Phong thu: {d['defense']}")
    result.append(d)

with open("dorks_simulator_report.json", "w", encoding="utf-8") as f:
    json.dump(result, f, ensure_ascii=False, indent=2)
print("\n[+] Da luu: dorks_simulator_report.json")
```

**Chạy:**
```bash
python3 CODE/week02_google_dorks_scanner.py
```

> ⚠️ Dork thực sự trên Google/Search engine nhắm domain người khác = footprinting từ xa không phép. Hãy dùng lab này chỉ để **mô phỏng cú pháp**, và nếu muốn test thật: chạy dork với chính domain của bạn.

---

## Bài Tập Về Nhà / Homework

1. **Báo cáo OSINT tự kiểm tra:** quyết định **1 domain bạn sở hữu/đăng ký** (nếu không có, dùng `example.com` kèm ghi chú rõ). Chạy `footprint_audit.py`, sau đó ghi lại thủ công: WHOIS bị expose gì? DNS lộ mail server/NS nào? Subdomain nào còn sống? **Đề xuất 5 hành động đóng lỗ** (theo bảng Countermeasures mục 5).
2. **Code:** chạy `google_dorks_scanner.py`, chọn **2 dork** trong danh sách, giải thích bằng lời **vì sao** nó nguy hiểm với domain của bạn và **giải pháp phòng thủ** đi kèm (chụp màn hình kết quả).
3. **Đọc + tóm tắt:** `CEHv13 - Module 02` phần `Footprinting through Search Engines` và `Advanced Google Hacking` — tóm tắt 10 dòng, nêu rõ **3 kỹ thuật** mà attacker có thể khai thác qua Google.
4. **Thiết kế chính sách:** viết **mẫu Privacy Policy** tối thiểu 5 mục cho một công ty giả định, giải thích từng mục góp phần **giảm bề mặt OSINT** ra sao.

---

## Rubric Đánh Giá Tuần 2

| Tiêu chí | Xuất sắc (90-100%) | Khá (70-89%) | Yếu (<70%) |
|----------|--------------------|--------------|------------|
| **Báo cáo OSINT** | Chạy audit trên domain mình, đọc đúng WHOIS/DNS/NS, đủ 5 hành động đóng lỗ có căn cứ (40đ) | Chạy được nhưng thiếu phân tích WHOIS/DNS (25đ) | Không chạy được hoặc quét domain người khác (10đ) |
| **Code mô phỏng** | Dorks simulator chạy được, giải thích đúng 2 dork + defense (30đ) | Chạy được nhưng thiếu giải thích defense (20đ) | Không chạy được (5đ) |
| **Hiểu lý thuyết** | Phân biệt đúng passive/active, liệt kê đủ công cụ & countermeasures (30đ) | Trộn lẫn passive/active, thiếu countermeasures (20đ) | Chép mô tả công cụ không hiểu (5đ) |

---

## Checklist Đầu Ra Tuần 2

- [ ] Giải thích được footprinting là pha 1 trong 5 pha tấn công
- [ ] Phân biệt rõ Passive vs Active Footprinting (kèm ví dụ)
- [ ] Dùng được `nslookup` / `dig` để lấy A, MX, NS records
- [ ] Chạy thành công `footprint_audit.py` trên chính domain mình (hoặc example.com)
- [ ] Hiểu ít nhất 4 loại Google Dork và ý nghĩa phòng thủ
- [ ] Trình bày được ít nhất 4 countermeasures giảm dấu chân OSINT
- [ ] Nắm quy tắc đạo đức: không footprint/thu thập OSINT người khác