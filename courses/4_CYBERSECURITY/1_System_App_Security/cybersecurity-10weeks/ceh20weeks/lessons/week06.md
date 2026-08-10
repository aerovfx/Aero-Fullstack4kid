# Tuần 6: System Hacking (CEH v13 Module 06)

> Tương ứng: `CEHv13PDF/CEHv13 - Module 06 - System Hacking.pdf`

## Mục Tiêu Tuần / Week Objectives

Bám sát nội dung **Module 06** trong giáo trình CEH v13. Kết thúc tuần, học viên:

1. Nắm vững **quy trình 4 bước System Hacking**: Gaining Access → Escalating Privileges → Maintaining Access → Clearing Logs.
2. Hiểu các kỹ thuật **tấn công mật khẩu** (dictionary, brute-force, rainbow table, hash cracking, offline/online) và cấu trúc **LM/NTLM hash** trên Windows.
3. Biết cách mật khẩu được trích xuất từ **SAM database (Windows)** và **/etc/shadow (Linux)** — LÝ THUYẾT, không thực hành.
4. Phân biệt **privilege escalation ngang/dọc**, các vector kernel exploit & misconfiguration (sudo, SUID, unquoted service path).
5. Xây dựng khả năng **phòng thủ**: password policy, UAC, LAPS, 2FA, hardening tài khoản, phát hiện & chống **clearing tracks** và **data exfiltration**.

---

## Lý Thuyết / Theory

### 1. Tổng Quan Quy Trình System Hacking

CEH Module 06 mô tả 4 bước chính sau khi đã có thông tin từ Threat Recon & Vulnerability Analysis (Tuần 3-5):

```
Gaining Access (Chiếm quyền truy cập)
    → Escalating Privileges (Leo thang đặc quyền)
    → Maintaining Access (Duy trì / đặt persistent)
    → Clearing Logs (Xoá dấu vết trên hệ thống)
```

| Bước | Mục tiêu | Kỹ thuật điển hình |
|------|----------|--------------------|
| **Gaining Access** | Có phiên làm việc đầu tiên trên máy | Password attack, exploit lỗ hổng, phishing, session hijack |
| **Escalating Privileges** | Từ user thường lên Admin / SYSTEM / root | Kernel exploit, misconfiguration, token impersonation |
| **Maintaining Access** | Giữ quyền điều khiển lâu dài | Backdoor, RAT, scheduled task, registry run key |
| **Clearing Logs** | Xoá / sửa dấu vết để tránh bị phát hiện | Xoá event log, only-LOG-tampering, timestomping |

> **Liên hệ Tuần 1:** Các bước này tương ứng với pha 3-5 của *Hacking Phases* trong Module 01 — lần này đi vào CƠ CHẾ chi tiết cấp hệ điều hành.

### 2. Password Attacks (Tấn công mật khẩu)

| Loại | Cách hoạt động | Ghi chú |
|------|----------------|---------|
| **Dictionary attack** | Thử danh sách từ có sẵn (từ điển, top common passwords) | Nhanh, vỡ nhanh các mật khẩu thường gặp |
| **Brute-force attack** | Thử MỌI tổ hợp ký tự có thể | Chậm, tỷ lệ thành công phụ thuộc entropy |
| **Hybrid attack** | Dictionary + rule (thêm số/ký tự `p@ssw0rd!`, `pass1`) | Hashcat `-r`, rất hiệu quả thực tế |
| **Rainbow table** | Tra cứu hash trong bảng precomputed | Cực nhanh nhưng tốn dung lượng; hết hiệu quả khi có *salt* |
| **Hash cracking (offline)** | Băm từ điển rồi so hash với hash lấy được | Kẻ tấn công không cần tiếp xúc máy nạn nhân |
| **Online attack** | Thử mật khẩu qua giao thức thật (RDP, SSH, web) | Dễ bị lockout / phát hiện; có **keylog, phishing** |

Kết quả tấn công mật khẩu được chống mạnh bằng **salt + slow hash**: một hash đúng chuẩn (bcrypt/argon2) biến 1 từ điển thành hàng tỷ năm CPU — xem Lab 2.

### 3. Password Extraction & Cấu Trúc Hash (LÝ THUYẾT)

> [!WARNING]
> Mục này chỉ để **hiểu kiến thức phòng thủ**. Dumping hash từ máy thật bằng Mimikatz/John là bất hợp pháp nếu không thuộc phạm vi lab của bạn.

- **Windows — SAM database:** file `C:\Windows\System32\config\SAM`, khóa bảo vệ nằm trong hệ thống (SYSKEY). Minh chứng bằng `reg save HKLM\SAM` hoặc volume shadow copy. Hash NTLM được lưu (thay cho LM, đã bỏ mặc định từ Windows 7/Server 2008).
- **LM vs NTLM hash:**
  - **LM:** chia mật khẩu thành 2 nửa 7 ký tự, *upper-case*, không salt → dễ vỡ, mỗi nửa chỉ 56-bit.
  - **NTLM:** MD4 (unicode) toàn chuỗi, không salt, dùng cho NTLMv2 authentication. Vẫn là **fast hash** → vỡ nhanh nếu mật khẩu yếu.
- **Linux — /etc/shadow:** chỉ root đọc được; lưu `$id$salt$hash` với các id `$1$` (MD5), `$5$` (SHA-256), `$6$` (SHA-512), además **yescrypt/argon2** trên các distro hiện đại. **Salt** làm rainbow table vô dụng.
- **Mimikatz (CHỈ lab):** chạy trên máy nạn nhân, dùng `sekurlsa::logonpasswords` để trích hash/dmôn từ LSASS in-memory. Vì sao nguy hiểm: có thể làm được mà không cần admin credentials nào trong nhiều trường hợp cũ (pass-the-hash).
- **Công cụ khác (lab):** John the Ripper (`/etc/shadow`, `--format=nt`), Hashcat (GPU offline), ophcrack (rainbow table v1.9.1.hc).

**Tóm tắt vì sao hash yếu nguy hiểm (đọc từ Lab 2):** MD4/MD5/SHA-1 chạy hàng tỷ hash/giây trên GPU → dictionary + brute-force vỡ trong giây/phút. NIST từ lâu đã dẹp MD5/SHA-1 (2011+). Thấy hash + mật khẩu yếu = sớm muộn vỡ.

### 4. Privilege Escalation (Leo thang đặc quyền)

- **Horizontal (ngang):** chuyển từ tài khoản A → tài khoản B cùng cấp quyền (vd chiếm tài khoản admin khác trong cùng nhóm).
- **Vertical (dọc):** user thường → root/admin/SYSTEM thông qua:
  - **Kernel exploit:** lỗ hổng OS (vd Dirty COW CVE-2016-5195) — luôn update kernel, theo dõi CVE.
  - **Misconfiguration:**
    - `sudo` sai rule (`sudo -l`, secure_path, NOPASSWD).
    - **SUID/SGID** trên binary có thể exploit (`find / -perm -4000`), `>>` không được phép ghi qua suid.
    - **Unquoted service path** trên Windows: service path có space và không có quotes → attacker đặt executable chèn vào `/Program Files/`.
    - Credentials trong script, registry, `searchsploit` cho service version cũ.
  - **Token / Cached credentials:** Steam, DPAPI, token impersonation SeImpersonatePrivilege (potato, RogueWinRM...).

**Phòng thủ:** dùng ít quyền nhất (least privilege), *admin account separation* (một tài khoản dùng hằng ngày tách khỏi tài khoản admin), patch kernel, audit SUID list, luôn quote đường dẫn service.

### 5. Maintaining Access (Persistence)

| Kỹ thuật | Cơ chế |
|----------|--------|
| **Backdoor / RAT** | Chương trình remote access (DarkComet, njRAT, C2 beacon) |
| **Scheduled tasks / cron** | Kẻ tấn công lên lịch chạy payload định kỳ |
| **Registry run keys** | `HKCU\Software\Microsoft\Windows\CurrentVersion\Run` → chạy khi login |
| **Services** | Cài Dịch vụ Windows giả (một bước trong Unquoted path abuse) |
| **Persistence Linux** | `~/.bashrc`, `cron`, `systemd unit`, `LD_PRELOAD` |

**Phòng thủ:** Sysmon/Windows Event Log theo dõi `Run`, scheduled tasks, service mới; triển khai bật **Windows Defender / EDR**, ứng dụng chính sách AppLocker.

### 6. Clearing Tracks — Hiểu để PHÒNG THỦ (LÝ THUYẾT Defensive)

> [!WARNING]
> Đây là nội dung **giải thích chiều tấn công nhằm PHÒNG THỦ**: bạn cần biết kẻ xấu sẽ xoá gì để cấu hình hệ thống phát hiện & log tập trung. TUYỆT ĐỐI KHÔNG thực hành xoá log trên máy thật ngoài lab.

- Xoá event log (`wevtutil cl`, `Clear-EventLog`), xoá file log trên Linux (`rm`, chỉnh syslog).
- **Timestomping:** sửa MAC times (mtime/atime/ctime) của file nguồn để tránh bị chỉ ra thay đổi — `timestomp` trong Kali.
- **Log tampering:** chỉnh/sửa nội dung log để đánh lạc hướng điều tra.

**Phòng thủ:** **Centralized logging** (SIEM — Wazuh, Graylog, Windows Event Forwarding), *write once* / hash-chứng thực log (immutable log, append-only, remote syslog), thường xuyên so kè log với baseline. Vì log ở xa máy nạn nhân nên kẻ tấn công không xoá được.

### 7. Steganography, Rootkit & Data Exfiltration (Giới thiệu)

- **Steganography:** giấu dữ liệu trong ảnh/âm thanh/video (vd giấu payload trong ảnh Stego). CEH yêu cầu biết khái niệm + công cụ (Steghide, OpenStego, zsteg auto-strip PNG).
- **Data exfiltration:** lấy dữ liệu ra khỏi hệ thống — qua DNS tunneling, HTTPS C2, encoding base64/hex, hoặc giấu trong gói tin hợp lệ. Phòng thủ: giám sát DLP (Data Loss Prevention), DNS egress filtering, anomaly detection trên lưu lượng mạng.
- **Rootkit:** ẩn tiến trình/file/module khỏi hệ điều hành (kernel mode). Phòng thủ: Secure Boot, driver signing, EDR.

### 8. Phòng Thủ Tổng Hợp (Defense)

- **UAC (Windows):** cấu hình mức `Always notify`, hạn chế auto-elevate; không tắt bằng registry tùy tiện.
- **Password Policy:** chiều dài ≥ 12 (khuyến nghị NIST SP 800-63B coi trọng **độ dài**, không ép xoay đổi thường xuyên; không reuse; không dùng top common).
- **Mật khẩu mạnh + passphrase:** entropy đủ cao (xem Lab 1) và MFA/2FA luôn bật.
- **LAPS (Local Administrator Password Solution):** quản lý & xoay mật khẩu tài khoản local admin cho từng máy — chặn pass-the-hash từ tài khoản admin dùng chung.
- **Harden account:** tài khoản admin riêng, least privilege, không logon với admin hằng ngày, theo dõi `whoami /priv` bất thường, patch định kỳ.

**Checklist hardening đầy đủ** được sinh tự động trong Lab 3 (chuẩn CIS/CEH).

---

## Cảnh Báo An Toàn & Đạo Đức / Safety & Ethics

> [!WARNING]
> 1. Toàn bộ TUẦN 6 **CHỐT PHẦN LÝ THUYẾT KHÔNG thực hành** trên hệ thống thật: **dumping hash (Mimikatz, SAM, /etc/shadow), leo thang đặc quyền, cài persistence, xoá log** — chỉ được làm trên **Metasploitable 2/3 VM**, Kali VM, hoặc lab ảo bạn sở hữu, và 100% phải **in scope** trong phòng lab.
> 2. **TUYỆT ĐỐI không dùng Mimikatz / password dumping trên máy thật ngoài lab** — đây là hành vi của black hat, gây hại cho hệ thống và là trọng tội về an ninh mạng (Luật An ninh mạng 2018 VN).
> 3. Thực hành an toàn duy nhất được yêu cầu tuần này là **PHÒNG THỦ**: phân tích độ mạnh mật khẩu của chính bạn (Lab 1), demo so sánh hash (Lab 2) và tạo checklist hardening (Lab 3).
> 4. Vi phạm quy tắc này = **FAIL toàn bộ khoá học** và có thể chịu trách nhiệm hình sự.

---

## Thực Hành Code / Hands-On (Defensive-first)

> Code đầy đủ trong `CODE/week06_password_strength.py`. Các lab này **chạy trên máy của bạn** , không đụng hệ thống ai khác.

### Lab 1: Password Strength Analyzer — Phân tích độ mạnh mật khẩu (Python)

Công cụ phòng thủ: tính **entropy** (bits), phát hiện top-common-password / pattern yếu, cho **điểm + khuyến nghị chính sách** theo NIST SP 800-63B. Tool **không lưu** mật khẩu — chỉ nhận qua STDIN rồi thải bỏ.

```bash
# An toàn: chạy demo với mật khẩu mẫu có sẵn
python3 CODE/week06_password_strength.py --demo

# Tự đánh giá MẬT KHẨU CỦA BẠN (không ghi, không hiển thị trong prompt)
python3 CODE/week06_password_strength.py

# In template chính sách mật khẩu cho doanh nghiệp
python3 CODE/week06_password_strength.py --policy
```

Cơ chế entropy trong file:

```python
def compute_entropy(password: str) -> float:
    """Entropy = chiều dài x log2(kích thước pool ký tự dùng thực tế)."""
    pw = password.strip()
    if not pw:
        return 0.0
    pool = 0
    if re.search(r"[a-z]", pw): pool += 26
    if re.search(r"[A-Z]", pw): pool += 26
    if re.search(r"[0-9]", pw): pool += 10
    if re.search(r"[^a-zA-Z0-9]", pw): pool += 33
    if pool == 0:
        return 0.0
    return len(pw) * math.log2(pool)
```

**Giải thích CEH:** mật khẩu `Sunshine!` (9 ký tự) entropy ≈ 52 bits → GPU 10 tỷ hash/s vỡ trong **phút**; `tR4^iN9-M00n_L33p$` (19 ký tự) entropy ≈ 115 bits → **hàng tỷ năm**. Độ dài là tài sản lớn nhất.

### Lab 2: Hash Comparison — Vì sao hash yếu nguy hiểm (Python, offline, hash tự sinh)

> Code minh hoạ bên dưới — đọc & chạy như một phần lab. **Chỉ hash mật khẩu DEMO cụ thể**, không quét hệ thống, không đọc hash của ai.

```python
# week06_code/hash_comparison.py (đọc hiểu trong lesson, chạy: python3 hash_comparison.py)
import hashlib, datetime, secrets

def time_hash(fn, data, rounds=100000):
    start = datetime.datetime.now()
    for _ in range(rounds):
        fn(data)
    return (datetime.datetime.now() - start).total_seconds()

demo_pw = "Tr4ining!Demo"          # CHỈ mật khẩu demo
b = demo_pw.encode()

t_md5  = time_hash(lambda: hashlib.md5(b))
t_sha1 = time_hash(lambda: hashlib.sha1(b))
t_sha2 = time_hash(lambda: hashlib.sha256(b))
try:
    import argon2
    t_argon = time_hash(lambda: argon2.PasswordHasher().hash(demo_pw), rounds=1000)
except ImportError:
    t_argon = None

print(f"MD5    : {t_md5:7.4f}s  -> GPU ~1-10 tỷ hash/giây (VỠ DỄ)"
      f"\nSHA-1  : {t_sha1:7.4f}s  -> cấm dùng từ 2017 (SHAttered)"
      f"\nSHA-256: {t_sha2:7.4f}s  -> hash nhanh, vẫn dễ dictionary attack offline"
      f"\nArgon2 : {t_argon or 'cần pip install argon2-cffi'} -> SLOW HASH chống brute-force (NIST khuyến nghị)")
```

Mô phỏng **offline dictionary attack** an toàn — không cần network, chỉ so hash ngay trong RAM:

```python
cracked = None
target_hash = hashlib.sha256(b).hexdigest()
for word in ["123456", "password", demo_pw, "admin123", "Tr4ining"]:
    if hashlib.sha256(word.encode()).hexdigest() == target_hash:
        cracked = word
print(f"Kết quả: {'VỠ hash (dictionary hit)' if cracked else 'Chưa vỡ'} - hash demo SHA-256 = {target_hash[:16]}...")
```

**Vì sao học việc này:** hiểu rõ chủ đề *hash cracking* để biết **phòng thủ** — ta cần slow hash (argon2/bcrypt + salt), policy mật khẩu mạnh. Tất cả âm nhạc hoàn toàn offline với hash tự tạo, không đụng dữ liệu thật.

### Lab 3: Windows Hardening Checklist Generator (Python)

Sinh checklist **phòng thủ** theo CIS Benchmark / CEH Module 06 — nhắc việc cho admin:

```python
# week06_code/windows_hardening_checklist.py (đọc hiểu trong lesson)
checklist = [
    ("UAC",        "Đặt mức 'Always notify' (HKCU\\...\\EnableLUA=1), không tắt"),
    ("Password",   "Min length >= 12, cấm top-common, không reused (NIST 800-63B)"),
    ("LAPS",       "Bật Local Administrator Password Solution - xoay mật khẩu local admin"),
    ("Auditing",   "Enable Audit Logon/Account Management + Event Forwarding -> SIEM"),
    ("Services",   "Kiểm tra Unquoted Service Path & bind quyền tối thiểu"),
    ("UEFI",       "Secure Boot + driver signing để chống rootkit kernel-mode"),
    ("MFA",        "Bắt buộc MFA cho admin & remote access"),
]
for item, desc in checklist:
    print(f"[{item:<10}] {desc}")
```

Chạy thật trong `CODE/week06_password_strength.py --policy` để thấy các khuyến nghị dạng máy đọc được.

---

## Bài Tập Về Nhà / Homework

1. **Phân tích entropy mật khẩu của chính bạn:** dùng `week06_password_strength.py` phân tích 3 mật khẩu mẫu (1 dễ, 1 trung bình, 1 mạnh). Ghi lại entropy (bits), điểm, mức độ và câu trả lời: **entropy bao nhiêu thì coi là tạm ổn để chống offline cracking** (NIST khuyến nghị ≥ 60-70 bits với passphrase)?
2. **Demo an toàn:** chạy 2 script trong Lab 2 (`hash_comparison.py`, mô phỏng dictionary attack với hash SHA-256 demo), chụp màn hình kết quả, và giải thích trong 5 dòng **vì sao admin nên dùng argon2 khi cài hệ thống xác thực**.
3. **Tóm tắt 5 biện pháp hardening:** từ Lab 3 + mục Lý Thuyết §8, nêu **5 biện pháp** mình sẽ làm ngay trên máy cá nhân / công ty (VD: bật UAC, LAPS, audit log tập trung, MFA, policy password) — mỗi biện pháp 1-2 dòng lý do.

---

## Rubric Đánh Giá Tuần 6

| Tiêu chí | Xuất sắc (90-100%) | Khá (70-89%) | Yếu (<70%) |
|----------|--------------------|--------------|------------|
| **Bài tập entropy** | Tính đúng entropy 3 mật khẩu, nhận xét chuẩn NIST, chụp ảnh rõ (40đ) | Tính đúng nhưng thiếu nhận xét theo chuẩn (25đ) | Không tính được entropy / không chạy tool (10đ) |
| **Demo hash cracking an toàn** | Chạy được, hiểu vì sao hash nhanh vỡ, giải thích case argon2 đúng (30đ) | Chạy được nhưng lời giải thích mơ hồ (20đ) | Không chạy được / dùng mật khẩu thật (5đ) |
| **Tóm tắt hardening** | Đủ 5 biện pháp, mỗi biện pháp có lý do kỹ thuật (30đ) | Đủ 5 biện pháp nhưng thiếu lý do (20đ) | Liệt kê dưới 5 mục / chép lại không hiểu (5đ) |

---

## Checklist Đầu Ra Tuần 6

- [ ] Trình bày được 4 bước System Hacking (Access → Escalate → Maintain → Clear)
- [ ] Phân biệt dictionary / brute-force / rainbow table / hash cracking; giải thích vì sao salt + slow hash chống được phần lớn
- [ ] Biết LM vs NTLM, vị trí SAM (Windows) và /etc/shadow (Linux) — LÝ THUYẾT
- [ ] Phân biệt privilege escalation ngang/dọc; liệt kê ít nhất 3 vector (kernel, sudo/SUID, unquoted path)
- [ ] Kể được 5 kỹ thuật persistence (backdoor, RAT, scheduled task, registry run key, service)
- [ ] Hiểu clearing tracks để PHÒNG THỦ (centralized log, immutable, SIEM)
- [ ] Trả lời được 5 biện pháp hardening cho Windows (UAC, policy, LAPS, audit, MFA)
- [ ] Chạy thành công `week06_password_strength.py --demo` / `--policy` và 2 script Lab 2 trên máy của mình