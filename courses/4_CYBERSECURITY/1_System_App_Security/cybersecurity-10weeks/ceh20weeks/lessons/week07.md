# Tuần 7: Malware Threats (CEH v13 Module 07)

> Module CEH v13 tương ứng: **07 — Malware Threats**. Nội dung đã được chuẩn hóa sang Markdown.

## Mục Tiêu Tuần / Week Objectives

Bám sát nội dung **Module 07** trong giáo trình CEH v13. Kết thúc tuần, học viên:

1. Phân biệt chính xác các **loại malware**: virus, worm, trojan, rootkit, ransomware, spyware, adware, keylogger, botnet, RAT, và **fileless malware**.
2. Hiểu **vòng đời tấn công bằng malware** (malware propagation) và các **thành phần** cấu thành: crypter, packer, obfuscation, shellcode, evasion (stealth) và attack vector.
3. Phân biệt **static analysis** vs **dynamic analysis**, vai trò của **sandbox**, và giới thiệu **reverse engineering** mã độc.
4. Nhận diện **APT (Advanced Persistent Threat)** và mối liên hệ với Cyber Kill Chain (Tuần 1).
5. Nắm được **countermeasures** chống malware: EDR/AV, ứng dụng ít đặc quyền, sandboxing, patch, network segmentation — và biết cách **phân tích sơ bộ** một file nghi ngờ bằng công cụ phòng thủ (Lab 1).

---

## Lý Thuyết / Theory

### 1. Phân Loại Malware

| Loại | Đặc điểm | Ví dụ điển hình |
|------|----------|-----------------|
| **Virus** | Tự nhân bản, cần **host file/program** để gắn vào | Boot sector virus, macro virus |
| **Worm** | Tự nhân bản **qua mạng**, không cần host | WannaCry (lan qua SMB), Morris worm |
| **Trojan** | Giả danh phần mềm hợp lệ, cài backdoor | Emotet, njRAT, DarkComet |
| **Ransomware** | Mã hoá dữ liệu, đòi tiền chuộc | LockBit, Ryuk, Revil |
| **Rootkit** | Ẩn tiến trình/file/module khỏi OS | Kernel-mode rootkit, bootkit |
| **Spyware** | Theo dõi người dùng, thu thập dữ liệu | Keylogger, screen capture |
| **Adware** | Quảng cáo không mong muốn | Pop-up ad injectors |
| **Keylogger** | Ghi lại bàn phím | Hardware & software keylogger |
| **Botnet** | Mạng máy bị điều khiển từ C2 | Mirai, Zeus, Emotet |
| **RAT** | Remote Access Trojan — điều khiển từ xa | DarkComet, njRAT, NanoCore |
| **Fileless** | Không ghi file đĩa, sống trong RAM/registry | PowerShell scripts, WMI abuse |

> **Lưu ý CEH:** CEH v13 nhấn mạnh phân biệt **virus** (cần host) vs **worm** (tự lan truyền) và khái niệm **trojan** (giả danh). Đây là câu hỏi lý thuyết kinh điển trong đề thi.

### 2. Vòng Đời Malware (Malware Propagation)

```
Propagation (lây lan)
    → Injection (chèn vào hệ thống)
    → Payload Execution (thực thi tác vụ xấu)
    → Payload Stealth (ẩn mình)
    → Trigger (kích hoạt — time/event based)
```

| Giai đoạn | Hoạt động |
|-----------|-----------|
| **Propagation** | Worm/email lây sang máy khác, USB autorun |
| **Injection** | Chèn payload vào tiến trình hợp lệ (DLL injection) |
| **Payload Execution** | Thực thi đánh cắp, mã hoá, backdoor |
| **Stealth** | Trốn AV/EDR: packer, obfuscation, rootkit |
| **Trigger** | Kích hoạt theo thời gian / sự kiện / nhiễm môi trường |

### 3. Các Kỹ Thuật Che Giấu & Evasion (Hiểu để PHÒNG THỦ)

| Kỹ thuật | Cơ chế | Phòng thủ |
|----------|--------|-----------|
| **Obfuscation** | Làm rối mã nguồn (Base64, XOR, anti-string) | YARA rule, heuristic analysis |
| **Encryption** | Mã hoá payload, chỉ giải mã khi chạy | Sandbox unpacking, memory dump |
| **Packer/Crypter** | Nén/mã hoá executable để né signature | Entropy detection (Lab 1) |
| **Stealth (rootkit)** | Hook API, giấu trong kernel | Secure Boot, driver signing |
| **Anti-vm / Anti-debug** | Phát hiện sandbox, trì hoãn thực thi | Harden sandbox, có giới hạn thời gian |

> [!NOTE]
> Hiểu evasion để **chọn đúng kỹ thuật phòng thủ**: AV signature bị đánh bại bởi packer, nên cần **EDR + behavioral detection + sandbox** — đây là lý do CEH v13 đưa nội dung này vào module.

### 4. Malware Analysis — Static vs Dynamic

| Tiếp cận | Mô tả | Công cụ điển hình |
|----------|-------|-------------------|
| **Static analysis** | Phân tích file KHÔNG chạy: hash, strings, PE header, entropy | `hash`, `strings`, PEiD, Detect It Easy, yara |
| **Dynamic analysis** | Chạy trong **sandbox**, quan sát hành vi | Cuckoo Sandbox, ProcMon, Wireshark |
| **Code analysis** | Reverse engineering để hiểu logic | Ghidra, IDA, x64dbg, radare2 |

**Quy trình an toàn:** hash → scan online (VT) → strings → entropy → chạy trong sandbox → phân tích hành vi.

### 5. APT & Kill Chain

- **APT**: nhóm tấn công có tổ chức, được tài trợ, mục tiêu lớn, tồn tại lâu dài (ví dụ APT28, APT29).
- Liên hệ với **Cyber Kill Chain** (Tuần 1): Weaponization → Delivery → Exploitation → Installation → C2 → Actions. Malware là **vũ khí** (weapon) trong giai đoạn Weaponization & Delivery.

---

## Cảnh Báo An Toàn & Đạo Đức / Safety & Ethics

> [!WARNING]
> 1. Toàn bộ Tuần 7 **CHỈ phân tích file của CHÍNH BẠN** hoặc file mẫu an toàn (text, PDF, ảnh, script bạn tự viết). **KHÔNG tải / chạy / phân tích mã độc thật** từ mạng.
> 2. **KHÔNG thực hành tạo malware** (virus, worm, trojan, ransomware) dù ở lab — nội dung chỉ dạy **cách phòng thủ & phân tích phòng ngự**.
> 3. Không bao giờ **chạy** file nghi ngờ trên máy thật — chỉ dùng tool **static analysis** (Lab 1) để đọc hash/strings/entropy.
> 4. Vi phạm = **FAIL toàn bộ khoá học** và có thể chịu trách nhiệm hình sự (Luật An ninh mạng 2018 VN).

---

## Thực Học Code / Hands-On (Defensive-first)

> Code đầy đủ trong `CODE/week07_malware_triage.py`. Toàn bộ lab **không kết nối mạng** và **không thực thi** file — chỉ đọc dữ liệu.

### Lab 1: Malware Triage Tool — Phân tích sơ bộ file nghi ngờ (Python)

Công cụ phòng thủ: đọc **hash** (MD5/SHA-1/SHA-256), **entropy** (độ ngẫu nhiên — packer thường có entropy cao), **PE header** (file .exe/.dll), và quét **chuỗi nghi ngờ** (suspicious strings) như `CreateRemoteThread`, `VirtualAlloc`, `http://`, `powershell`. Tool **không chạy** file — chỉ đọc từng byte.

```bash
# Demo an toàn trên file tạo sẵn (KHÔNG phải mã độc thật)
python3 CODE/week07_malware_triage.py --demo

# Phân tích một file của bạn (PDF, script, exe...) — chỉ ĐỌC, không chạy
python3 CODE/week07_malware_triage.py --file /path/to/file
```

Kết quả mẫu (chế độ demo tự sinh file text ngẫu nhiên):

```
[FILE]     /tmp/triage_demo.bin (1,024 bytes)
[SHA-256]  d6e0...9f3a
[MD5]      5f7c...8b2e
[ENTROPY]  5.32 / 8.0 bits  -> mức trung bình
[PE HEADER] Không (MZ header không có)
[SUSPICIOUS STRINGS] 2: 'http://', 'powershell'
[KẾT LUẬN] Cần phân tích sâu hơn (không tự kết luận là mã độc)
```

**Giải thích CEH:** entropy ≈ 8.0 thường gặp ở payload đã **packer/crypter** mã hoá; entropy thấp hơn 5 thường là văn bản. Đây là *heuristic*, không phải kết luận — cần kết hợp **hash lookup** (VirusTotal) và **sandbox**.

### Lab 2: Thực hành dòng lệnh Linux (static analysis cơ bản)

```bash
# Hash file (dùng chính file script của bài học)
sha256sum CODE/week07_malware_triage.py
md5sum    CODE/week07_malware_triage.py

# Chuỗi đọc được (ASCII) trong file — tìm từ khoá nhạy cảm
strings CODE/week07_malware_triage.py | grep -iE "http|powershell|VirtualAlloc|socket"

# Xem PE header file .exe (nếu có trên máy bạn) — KHÔNG chạy
file /path/to/file.exe
```

### Lab 3: YARA rule mẫu (nhận diện pattern)

YARA là công cụ chính thống trong phòng thủ — viết rule phát hiện chuỗi đặc trưng:

```yara
rule SuspiciousPowerShellDownload {
    meta:
        description = "Phát hiện script PowerShell tải nội dung từ mạng"
    strings:
        $a = "powershell" ascii wide
        $b = "DownloadString" ascii
        $c = "http://" ascii
        $d = "https://" ascii
    condition:
        2 of them
}
```

---

## Bài Tập Về Nhà / Homework

1. **Phân loại malware:** liệt kê 5 loại malware khác nhau, với mỗi loại nêu **1 ví dụ thực tế** và **1 countermeasure** phòng thủ.
2. **Triage thực hành:** chạy `week07_malware_triage.py --demo` và phân tích **1 file thật của bạn** (script, PDF, ảnh), chụp màn hình, giải thích entropy + suspicious strings.
3. **Nghiên cứu 1 vụ ransomware:** tìm hiểu 1 vụ (VD: WannaCry 2017) — nêu cách lây lan, cơ chế mã hoá, cách khắc phục, và 3 bài học phòng thủ.

---

## Rubric Đánh Giá Tuần 7

| Tiêu chí | Xuất sắc (90-100%) | Khá (70-89%) | Yếu (<70%) |
|----------|--------------------|--------------|------------|
| **Phân loại malware** | Đủ 5 loại + ví dụ + countermeasure chính xác (40đ) | Đủ 5 loại nhưng thiếu countermeasure (25đ) | Liệt kê dưới 5 / sai phân loại (10đ) |
| **Triage tool** | Chạy được, hiểu entropy & strings, chụp ảnh rõ (30đ) | Chạy được nhưng thiếu giải thích (20đ) | Không chạy được (5đ) |
| **Nghiên cứu ransomware** | Đủ 4 phần, phân tích đúng kỹ thuật (30đ) | Thiếu 1 phần / giải thích mơ hồ (20đ) | Chép lại không hiểu (5đ) |

---

## Checklist Đầu Ra Tuần 7

- [ ] Phân biệt được virus / worm / trojan / ransomware / rootkit / fileless
- [ ] Mô tả được vòng đời malware (Propagation → Injection → Execution → Stealth → Trigger)
- [ ] Hiểu static vs dynamic analysis và vai trò sandbox
- [ ] Hiểu vì sao packer/crypter đánh bại AV signature → cần EDR/behavioral
- [ ] Chạy thành công `week07_malware_triage.py --demo` trên máy của mình
- [ ] Trả lời được 5 countermeasures chống malware (AV/EDR, least privilege, sandbox, patch, segmentation)
