# Tuần 4: Enumeration (CEH v13 Module 04)

> Tương ứng: `CEHv13PDF/CEHv13 - Module 04 - Enumeration.pdf`

## Mục Tiêu Tuần / Week Objectives

Bám sát nội dung **Module 04** trong giáo trình CEH v13. Kết thúc tuần, học viên:

1. Hiểu **Enumeration là gì** và phân biệt rõ với **Scanning** (quét cổng) — enumeration là bước *chủ động* trích xuất dữ liệu, thông tin phục vụ tấn công tiếp theo (Gaining Access, Tuần 6).
2. Nắm kỹ thuật **SMB / NetBIOS enumeration** (port 135, 139, 445), **SNMP enumeration** (community string, port 161), và **DNS enumeration** (zone transfer).
3. Biết cách khai thác thông tin từ **LDAP**, **NFS/SMB shares**, **NTP**, và các dịch vụ **Windows / Linux** (net user, /etc/passwd, rpc, NFS exports).
4. Thực hành thành thạo bộ công cụ: **enum4linux**, **nmblookup**, **snmpwalk**, **dnsrecon**, **nslookup**, **LDAP search**.
5. Nắm được **countermeasures** (biện pháp đối phó) để phòng thủ: tắt dịch vụ không cần thiết, che giấu user accounts, củng cố community string SNMP, giới hạn firewall.

---

## Lý Thuyết / Theory

### 1. Enumeration Là Gì?

**Enumeration (liệt kê/trích xuất thông tin)** là giai đoạn **thứ 3 của Information Gathering**, sau Reconnaissance (Tuần 2) và Scanning (Tuần 3).

| Đặc điểm | Scanning | Enumeration |
|----------|----------|-------------|
| Thao tác | *Bị động* lắng nghe, quét cổng | *Chủ động* kết nối & trích xuất dữ liệu |
| Kết quả | Biết cổng nào **mở / đóng** | Biết **nội dung** phía sau cổng đó |
| Ví dụ | Port 445 OPEN | Share `//target/TempShare` với user `admin` |
| Mức độ nguy hiểm | Thấp | Cao — có thể bị log lại, cần ẩn nấp |

**Mục tiêu của Enumeration** là thu thập các *mỏ vàng thông tin*:

- **User accounts** (danh sách username dùng để brute-force sau này)
- **Share names** (SMB/NFS shares, NETBIOS share)
- **Services & Ports đang chạy** (services names, version)
- **SNMP community strings** (mật khẩu mặc định mở toang hệ thống)
- **DNS records** (zone transfer, hostname, MX records)
- **LDAP entries** (danh bạ user, OU, group, policy)
- **NTP / routing / session info** (clock, peers)

### 2. Enumeration Kỹ Thuật / Technical Enumeration

#### a) SMB Enumeration (port 139, 445)

- **SMB (Server Message Block)** — giao thức chia sẻ file/máy in của Windows, dùng TCP 445 (SMB over TCP) hoặc 139 (NetBIOS Session).
- NetBIOS dùng **UDP 137 (Name Service)** và **UDP 138 (Datagram)**.
- Kẻ tấn công liệt kê: `//target/share`, tên máy, domain, user list.

```bash
# Windows: net view (liệt kê share máy khác)
net view \\\\TARGET_IP /all

# Liệt kê user & group cục bộ
net user
net group
net localgroup administrators

# Linux: enum4linux - quét toàn diện SMB
enum4linux -a TARGET_IP
```

> Chú ý: `net view /all` lộ cả các share ẩn (thường có ký tự `$`, ví dụ `C$`, `IPC$`).

#### b) SNMP Enumeration (port 161 UDP)

- **SNMP (Simple Network Management Protocol)** dùng **community string** như *mật khẩu* để đọc thông tin thiết bị (router, switch, máy in, OS).
- Community string mặc định nguy hiểm thường là: **`public`** (đọc) và **`private`** (ghi).
- Dùng `snmpwalk` để *liệt kê cây MIB* (Management Information Base) bằng OID.

```bash
snmpwalk -v2c -c public TARGET_IP .1.3.6.1.2.1.1.1     # system description
snmpwalk -c public TARGET_IP 1.3.6.1.2.1.25.4.2.1.2    # running processes
snmpwalk -c public TARGET_IP 1.3.6.1.4.1.77.1.2.25     # Windows user accounts
snmpwalk -c public TARGET_IP 1.3.6.1.4.1.77.1.2.27     # installed software
```

Dùng `snmpset` với community `private` có thể **GHI** (thay đổi cấu hình) — cực kỳ nguy hiểm.

#### c) LDAP Enumeration (port 389 / 636)

- **LDAP (Lightweight Directory Access Protocol)** — dịch vụ thư mục (Active Directory sử dụng LDAP).
- Trích xuất: users, groups, organizational units (OU), máy tính, chính sách.

```bash
ldapsearch -x -H ldap://TARGET_IP -b "dc=corp,dc=local" "(objectClass=user)"
ldapsearch -x -H ldap://TARGET_IP -b "dc=corp,dc=local" "(objectClass=computer)"
```

#### d) NFS Enumeration (port 2049)

- **NFS (Network File System)** của Linux/UNIX — tương tự SMB của Windows.
- Liệt kê export, rồi mount thư mục chia sẻ để duyệt file.

```bash
showmount -e TARGET_IP            # list NFS exports
rpcinfo -p TARGET_IP              # list RPC services (port 111)
sudo mount -t nfs TARGET_IP:/share /mnt
```

#### e) DNS Enumeration (port 53)

- Zone transfer lộ toàn bộ bản ghi DNS nếu cho phép.

```bash
nslookup -type=any TARGET_DOMAIN
nslookup -query=ns TARGET_DOMAIN            # tìm name server
nslookup -type=soa TARGET_DOMAIN           # start of authority
# Zone transfer:
dig axfr @NS_SERVER TARGET_DOMAIN
```

`dnsrecon` — công cụ tự động hoá DNS enumeration:

```bash
dnsrecon -d target.com
dnsrecon -d target.com -t axfr
```

#### f) NTP Enumeration (port 123 UDP)

- **NTP (Network Time Protocol)** bị khai thác để: tìm peers (nguồn tấn công Smurf/NTP amplification), lấy thông tin host.

```bash
ntpdc -c monlist TARGET_IP      # liệt kê peers (monlist)
ntpq -c rv TARGET_IP            # read variables
```

### 3. Windows Enumeration

- **Thông tin attacker cần:** tên user, group, share, chính sách, service account, driver.
- Các lệnh Windows nội bộ (local enumeration):

```bash
net user            # danh sách user
net user username   # chi tiết 1 user
net group           # danh sách group
net share           # danh sách share
net start           # dịch vụ đang chạy
set                 # biến môi trường
whoami /all         # token + privileges
ipconfig /all
systeminfo          # thông tin OS, hotfix
```

- **NetBIOS Name Service** có thể liệt kê *tên máy, tên user, MAC* qua UDP 137:

```bash
nbtstat -a TARGET_IP      # Windows: NetBIOS name table từ xa
nmblookup -A TARGET_IP    # Linux: tương đương
```

### 4. Linux Enumeration

- Liệt kê cục bộ người dùng: `cat /etc/passwd`, `cat /etc/shadow` (cần root).
- RPC services: `rpcinfo -p`, `showmount -e`.
- NFS mount: `mount -t nfs`, kiểm tra `/etc/exports`.
- Dịch vụ mạng: `ss -tlnp`, `lsof -i` (như Tuần 1).

> So sánh nhanh: **Windows** dễ enum hơn vì NetBIOS + SMB không ẩn; **Linux** dựa vào SSH, NFS, và các service khác — thông tin hạn chế hơn nhưng NFS export sai cấu hình lại *lộ file trực tiếp*.

### 5. Tools Tổng Hợp

| Tool | Mục đích | Port liên quan |
|------|----------|----------------|
| `enum4linux` | Quét toàn diện SMB/NetBIOS (user, share, group, policy) | 139, 445 |
| `nmblookup` | Tra cứu NetBIOS name table | 137 |
| `nmap --script smb-enum-shares` | Liệt kê share SMB | 139, 445 |
| `snmpwalk` / `snmpset` | Đọc/ghi cây MIB SNMP | 161, 162 |
| `dnsrecon` | DNS enumeration tự động + zone transfer | 53 |
| `ldapsearch` | Truy vấn LDAP/Active Directory | 389, 636 |
| `showmount` / `rpcinfo` | Liệt kê NFS exports / RPC | 111, 2049 |
| `ntpdc -c monlist` | Liệt kê NTP peers | 123 |
| `nbtscan` | Quét NetBIOS nhanh cả subnet | 137, 139 |

### 6. Countermeasures (Biện Pháp Đối Phó)

- **Tắt các dịch vụ không cần thiết** (NetBIOS, SMB, SNMP, Telnet) — bề mặt tấn công nhỏ lại ngay.
- **SNMP:** đổi community string mặc định (`public`/`private`) thành chuỗi phức tạp; dùng SNMPv3 có xác thực + mã hoá.
- **SMB/NetBIOS:** chặn port 135, 139, 445 từ Internet bằng firewall; disable SMBv1 (Mãi còn là nguồn cơn của WannaCry).
- **DNS:** chỉ cho name server đáng tin cậy zone transfer; tắt recursion trên public DNS.
- **Ẩn user accounts:** bỏ quyền liệt kê của user thường; đổi tên tài khoản `Administrator` (RID 500), vô hiệu hoá user thừa.
- **NFS:** export theo `no_root_squash` → cực kỳ nguy hiểm; giới hạn IP được mount.
- **Log & monitor:** theo dõi truy vấn bất thường vào DNS/LDAP/SNMP, ghi nhận `enum4linux` footprint đặc trưng.

---

## Cảnh Báo An Toàn & Đạo Đức / Safety & Ethics

> [!WARNING]
> 1. Toàn bộ bài thực hành tuần này **CHỈ được phép chạy trên**: `127.0.0.1`, Metasploitable 2/3 VM (IP như `192.168.56.101`), Kali VM, hoặc máy ảo phòng lab của RIÊNG bạn.
> 2. `enum4linux`, `snmpwalk`, `dnsrecon` trên hệ thống **không thuộc về bạn** là hành vi **vi phạm pháp luật** (Luật An toàn thông tin mạng 2015, Nghị định 06/2022/NĐ-CP) — học viên vi phạm sẽ **FAIL toàn bộ khoá học**.
> 3. Metasploitable CHỈ cài đặt trong môi trường ảo hoá (VirtualBox/VMware/UTM) — **quyết không** chạy trên máy thật nối mạng công ty.

---

## Thực Hành Code / Hands-On (Defensive-first)

### Lab 1: Script `enumeration_smb.py` — Thu thập thông tin SMB share (Python)

Công cụ *học tập + phòng thủ*: script mô phỏng **enumeration quan sát** đối với SMB — kết nối hạng mục an toàn tới **Metasploitable VM (IP `192.168.56.101`)** hoặc `127.0.0.1`. Nếu không có máy ảo, chạy chế độ **DEMO** tạo dữ liệu giả lập để vẫn học được cấu trúc dữ liệu enumeration mà không đụng tới hệ thống thật.

```python
#!/usr/bin/env python3
# enumeration_smb.py
# SMB Share Enumeration - CHỈ nhắm tới máy ảo của bạn / localhost (BLUE TEAM)
# Tuần 4 - CEH Module 04.

import socket
import sys

BANNER = """  
========================================================================
  SMB ENUMERATION  (Phục vụ HỌC TẬP - DEFENSIVE)
  Chỉ dùng cho: 127.0.0.1 | Metasploitable VM | máy ảo của RIÊNG bạn.
  Quét hệ thống không thuộc về mình là BẤT HỢP PHÁP. Tự chịu trách nhiệm.
========================================================================
"""
print(BANNER)

# Zone an toàn: mặc định localhost; đổi sang IP Metasploitable khi có lab
TARGET = sys.argv[1] if len(sys.argv) > 1 else "127.0.0.1"
SMB_PORTS = [139, 445]  # NetBIOS Session, SMB over TCP
ALLOWED_NETS = ("127.0.0.1", "10.", "192.168.56.", "192.168.1.")


def is_safe_target(host):
    """Cảnh báo và chặn nếu địa chỉ không nằm trong phạm vi lab."""
    if not any(host.startswith(n) for n in ALLOWED_NETS):
        print("[!] DỪNG: địa chỉ ngoài phạm vi lab. Chỉ được quét máy ảo của bạn.")
        sys.exit(1)


def smb_responsive(host, port, timeout=1.5):
    """Kết nối TCP và đọc banner để xác nhận SMB đang chạy."""
    try:
        with socket.create_connection((host, port), timeout=timeout) as s:
            s.sendall(b"\x00\x00\x00\x45\xff\x53\x4d\x42\x72\x00\x00\x00"
                      b"\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"
                      b"\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"
                      b"\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"
                      b"\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"
                      b"\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00")
            banner = s.recv(256)
            # Banner đầu "SMB" (0xff 0x53 0x4d 0x42) = xác nhận giao thức SMB
            return banner[:4] == b"\xffSMB"
    except OSError:
        return False


def demo_mode(host):
    """Chế độ DEMO an toàn: dữ liệu giả lập để học cấu trúc, KHÔNG quét thật."""
    print("\n[DEMO MODE] Không quét thật → sinh dữ liệu share giả lập đúng định dạng.")
    return [
        {"share": "Tmp",  "type": "Disk", "comment": "Temp dirs"},
        {"share": "IPC$", "type": "IPC",  "comment": "Remote IPC - cần khai thác sau"},
        {"share": "Web",  "type": "Disk", "comment": "Apache htdocs - NHẠY CẢM"},
        {"share": "Backup", "type": "Disk", "comment": "Data sao lưu khách hàng"},
    ]


def main():
    is_safe_target(TARGET)
    print(f"[*] Target: {TARGET}")

    for port in SMB_PORTS:
        if smb_responsive(TARGET, port):
            print(f"[+] SMB PORT {port}: MỞ (xác nhận banner SMB) "
                  f"→ cửa sổ enumeration; kiểm tra firewall nếu là production.")
        else:
            print(f"[-] SMB PORT {port}: ĐÓNG / không phản hồi (tốt cho phòng thủ).")

    # Không có máy ảo → chạy DEMO; có máy ảo thì shares thật do enum4linux (Lab 2) trả về
    shares = demo_mode(TARGET)
    print("\n[*] Shares enum được (định dạng giống output của `net share` / enum4linux):")
    for sh in shares:
        print(f"    \\\\{TARGET}\\{sh['share']:<8} [{sh['type']:<4}] {sh['comment']}")

    print("\n[+] Nhận xét: share che đi được, nhưng IPC$ luôn tồn tại. "
          "Bài học - luôn kiểm tra cấu hình share của CHÍNH bạn.")
    print(f"[+] Nhắc lại: CHỈ chạy script này trên máy ảo / lab của bạn: {TARGET}")


if __name__ == "__main__":
    main()
```

**Chạy:**
```bash
python3 week04_code/enumeration_smb.py                 # chế độ localhost
python3 week04_code/enumeration_smb.py 192.168.56.101  # hướng về Metasploitable VM
```

> Giải thích: script chỉ xác nhận SMB còn mở và *mô phỏng* cấu trúc dữ liệu share — đủ để học khái niệm **enumeration** mà không cần khai thác thật (phần khai thác sẽ học ở Tuần 6 Gaining Access).

### Lab 2: enum4linux / nmblookup / snmpwalk trên máy ảo của bạn

**Bước 0 — Chuẩn bị máy ảo (bắt buộc):**
- Cài **Metasploitable 2** (file `.zip` ~800MB) trong VirtualBox/VMware/UTM, chạy NAT + Host-only (`192.168.56.x`).
- Hoặc dùng **Kali Linux** tự tấn công chính nó qua `127.0.0.1`.
- Mở ít nhất một dịch vụ target (SMB mặc định mở sẵn trên Metasploitable; SNMP mở gói `snmpd` trước).

**Bước 1 — Cài công cụ (Kali có sẵn; trên Ubuntu/Debian khác):**
```bash
sudo apt update
sudo apt install -y enum4linux snmp nmap dnsutils nbtscan \
    snmpd ldap-utils smbclient
```

**Bước 2 — SMB/NetBIOS enumeration:**
```bash
# 1) Enumeration toàn diện (user, share, group, policy)
enum4linux -a 192.168.56.101

# 2) NetBIOS name table - cho biết tên máy, user login, MAC
nmblookup -A 192.168.56.101

# 3) Liệt kê share SMB trực tiếp
nmap --script smb-enum-shares -p 139,445 192.168.56.101
smbclient -L //192.168.56.101/
```

**Bước 3 — SNMP enumeration:**
```bash
# Kiểm tra community string mặc định (đọc cây MIB)
snmpwalk -v2c -c public 192.168.56.101 .1.3.6.1.2.1.1.1
snmpwalk -v2c -c public 192.168.56.101 1.3.6.1.4.1.77.1.2.25   # Windows user (nếu có)
```

**Bước 4 — Giải thích output (viết vào báo cáo):**
- Dòng `Unix username/smb passwd history` = danh sách **user account** -> nguy cơ bị brute-force.
- `Sharename Type Comment` => biết cổng vào (`Web`, `tmp`, `Data`...).
- Nhánh MIB `1.3.6.1.4.1.77` = quản trị Windows (users/software).
- Nhận xét: **thông tin nào lộ ra là dấu hiệu cấu hình xấu**, và cách vá chính máy bạn (xem Lab 3).

### Lab 3 (Mở rộng): `enumeration_guard.py` — PHÒNG THỦ cổng enumeration

Script ngược lại của Lab 1/2: **tự quét máy mình** đề xuất đóng các cổng bị enum. File chạy được đầy đủ nằm tại `CODE/week04_enumeration_audit.py`.

```python
#!/usr/bin/env python3
# enumeration_guard.py
# ENUMERATION GUARD - Blue team: soat cổng enumeration tren may cua BAN.
# Chi quet 127.0.0.1. Tuần 4 - CEH Module 04.

import socket
import json
import datetime
import subprocess
import sys

TARGET = "127.0.0.1"

# Port bị tấn công qua enumeration (theo Module 04)
ENUM_PORTS = {
    135: "MS-RPC (Windows)",          # 135  <-  ms-rpc endpoint mapper
    137: "NetBIOS Name Service (UDP)",
    139: "NetBIOS Session (SMB)",
    445: "SMB over TCP",
    161: "SNMP Agent (UDP)",
    162: "SNMP Trap (UDP)",
    389: "LDAP",
    53:  "DNS zone transfer risk",
    111: "RPCbind / NFS-helper",
    2049: "NFS",
}

UDP_PORTS = {137, 161, 162}   # quét UDP chỉ kiểm tra "đang mở" khi nhận response

def tcp_open(port):
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.settimeout(0.4)
    try:
        return s.connect_ex((TARGET, port)) == 0
    finally:
        s.close()

def udp_maybe_open(port):
    """UDP: gửi gói rỗng, nếu nhận ICMP port unreachable là đóng; ngược lại 'canh đến'."""
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    s.settimeout(0.7)
    try:
        s.sendto(b"", (TARGET, port))
        s.recvfrom(128)
        return True
    except socket.timeout:
        return None        # ambiguous -> coi nhu 'mo / filtered'
    except ConnectionRefusedError:
        return False
    finally:
        s.close()

def recommend_close(port):
    """Đưa khuyến nghị đóng bằng firewall theo từng OS."""
    if sys.platform.startswith("darwin"):
        return f"sudo /usr/libexec/ApplicationFirewall/socketfilterfw " \
               f"--addblocked 127.0.0.1:{port}"
    return f"sudo ufw deny {port}/tcp"   # Linux (đổi tcp->udp nếu cần)

def main():
    print("=" * 62)
    print("ENUMERATION GUARD - Soát cổng enumeration trên máy của bạn")
    print(f"Thời gian: {datetime.datetime.now():%Y-%m-%d %H:%M}")
    print("=" * 62)
    report = {"host": TARGET,
              "scanned_at": str(datetime.datetime.now()),
              "result": []}
    open_found = []

    for port, desc in ENUM_PORTS.items():
        if port in UDP_PORTS:
            status = udp_maybe_open(port)
        else:
            status = tcp_open(port)
        if status is True:
            line = f"[!] MO  : {port:>5}  {desc}  -> KHUYEN NGHI DONG NGAY"
            print(line)
            open_found.append(port)
            report["result"].append({"port": port, "service": desc,
                                     "status": "open",
                                     "fix": recommend_close(port)})
        elif status is None:
            print(f"[?] AMBIG: {port:>5}  {desc}  (UDP filtered) - kiem tra firewall")
            report["result"].append({"port": port, "service": desc,
                                     "status": "unknown"})
        else:
            print(f"[-] DONG : {port:>5}  {desc}")

    print("-" * 62)
    if open_found:
        print(f"[KET QUA] {len(open_found)} cổng enumeration đang mở trên máy bạn.")
        for p in open_found:
            print(f"    -> {recommend_close(p)}")
        report["risk_level"] = "HIGH"
    else:
        print("[KET QUA] Không phát hiện cổng enumeration nào mở. Bề mặt tốt.")
        report["risk_level"] = "LOW"

    with open("enumeration_audit_report.json", "w", encoding="utf-8") as f:
        json.dump(report, f, ensure_ascii=False, indent=2)
    print("[+] Báo cáo JSON: enumeration_audit_report.json")

if __name__ == "__main__":
    main()
```

**Chạy & nhận xét:**
```bash
python3 CODE/week04_enumeration_audit.py
# Dòng MỞ = cửa sổ bạn cần đóng; AMBIG trên UDP = kiểm tra lệnh firewall của bạn
```

---

## Bài Tập Về Nhà / Homework

1. **Thực hành:** Trên máy ảo Metasploitable/Kali của bạn, chạy `enum4linux -a <IP_VM>` và `nmap --script smb-enum-shares`, chụp ảnh màn hình và **giải thích 5 dòng output quan trọng** (user nào lộ, share nào, độ nguy hiểm).
2. **Viết code:** Chạy `CODE/week04_enumeration_audit.py` trên máy bạn; ghi lại kết quả và gửi file `enumeration_audit_report.json` kèm 2 khuyến nghị đóng cổng cụ thể.
3. **Viết tóm tắt:** Trình bày **10 countermeasures** của Module 04 (ít nhất 3 cho SMB, 2 cho SNMP, 2 cho DNS, 3 khác) áp dụng cho một công ty nhỏ ở Việt Nam.

---

## Rubric Đánh Giá Tuần 4

| Tiêu chí | Xuất sắc (90-100%) | Khá (70-89%) | Yếu (<70%) |
|----------|--------------------|--------------|------------|
| **Báo cáo enum4linux** | Chạy đúng trên VM, giải thích chính xác user/share/risk (40đ) | Chạy được nhưng giải thích sơ sài (25đ) | Không chạy hoặc dùng IP không thuộc lab (10đ) |
| **Code phòng thủ** | `week04_enumeration_audit.py` chạy, xuất JSON, khuyến nghị đúng (30đ) | Chạy nhưng thiếu khuyến nghị/JSON (20đ) | Không chạy được (5đ) |
| **Tóm tắt countermeasures** | Đủ 10 biện pháp, nhóm đúng dịch vụ (SMB/SNMP/DNS) (30đ) | Thiếu nhóm/một vài biện pháp (20đ) | Chép tài liệu không hiểu (5đ) |

---

## Checklist Đầu Ra Tuần 4

- [ ] Phân biệt rõ Scanning vs Enumeration (có ví dụ mỗi loại)
- [ ] Biết thông tin mỗi port mang lại: 135 / 137 / 139 / 445 / 161 / 389 / 2049
- [ ] Chạy được `enum4linux`, `nmblookup`, `snmpwalk` trên máy ảo của mình
- [ ] Hiểu zone transfer DNS nguy hiểm thế nào và cách chặn
- [ ] Chạy thành công `week04_enumeration_audit.py` và đọc được JSON report
- [ ] Nêu được ít nhất 6 countermeasures và giải thích được "vì sao"
- [ ] Cam kết chỉ enumeration trên hệ thống được ủy quyền (127.0.0.1 / VM của mình)