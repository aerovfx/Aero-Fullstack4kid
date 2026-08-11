# Tuần 19: Hacking Cloud Computing (CEH v13 Module 19)

> Module CEH v13 tương ứng: **19 — Hacking Cloud Computing**. Nội dung đã được chuẩn hóa sang Markdown.

## Mục Tiêu Tuần / Week Objectives

Bám sát nội dung **Module 19** trong giáo trình CEH v13. Kết thúc tuần, học viên:

1. Hiểu mô hình dịch vụ cloud: **IaaS / PaaS / SaaS** và mô hình triển khai (public, private, hybrid, community).
2. Nắm **shared responsibility model** — ranh giới trách nhiệm bảo mật giữa nhà cung cấp (CSP) và khách hàng.
3. Hiểu các vector tấn công cloud: **misconfiguration (bucket S3 hở), credential leak (access key lộ), insecure API, instance takeover, insider threat, supply chain**.
4. Biết OWASP Cloud Top 10 & các tool kiểm tra (ScoutSuite, Prowler, cloud enum).
5. Xây dựng tool phòng thủ: **audit checklist IaaS + quét tìm access key/secret lộ trong config** (Lab 1) và phân tích shared responsibility (Lab 2).

---

## Lý Thuyết / Theory

### 1. Mô Hình Dịch Vụ & Triển Khai

| Mô hình | Bạn quản lý | Nhà cung cấp quản lý | Ví dụ |
|---------|-------------|----------------------|-------|
| **IaaS** | OS, app, data, network config | Hạ tầng (server, storage, hypervisor) | EC2, GCE, Azure VM |
| **PaaS** | App + data | Runtime, OS, hạ tầng | App Engine, Heroku, Azure App Service |
| **SaaS** | Dữ liệu trong app | Tất cả phần còn lại | Gmail, Office 365, Salesforce |

| Triển khai | Mô tả |
|------------|-------|
| **Public** | Tài nguyên dùng chung, trả theo dùng |
| **Private** | Riêng 1 tổ chức (on-prem hoặc hosted) |
| **Hybrid** | Kết hợp public + private (burst, dữ liệu nhạy cảm ở private) |
| **Community** | Chia sẻ giữa nhóm tổ chức cùng ngành |

### 2. Shared Responsibility Model

```
Bảo mật NƠI cloud:      CSP chịu (data center, hypervisor, mạng vật lý)
Bảo mật TRONG cloud:    KHÁCH HÀNG chịu (IAM, dữ liệu, OS VM, network rule, config)
```

> **Điểm mấu chốt CEH:** phần lớn vụ lộ dữ liệu cloud là do **khách hàng misconfig** (bucket hở, IAM quá rộng, key lộ) — KHÔNG phải lỗi CSP. Đừng đổ lỗi cho "cloud".

### 3. Các Vector Tấn Công Cloud

| Vector | Mô tả |
|--------|-------|
| **Misconfiguration** | S3/Blob bucket **public** (lộ hàng triệu record); security group mở 0.0.0.0/0; MFA tắt |
| **Credential/access key leak** | Key API lộ trong source/`~/.aws/credentials` commit lên git, pastebin |
| **Insecure APIs** | API quản lý cloud không xác thực/chưa rate-limit |
| **Account/instance takeover** | SSRF khai thác metadata (169.254.169.254) lấy IAM role |
| **Insider threat** | Admin bỏ đi mang credential; nhân viên bán dữ liệu |
| **Supply chain** | Base image/package bị nhiễm, phụ thuộc npm/pip độc |
| **DDoS & brute-force** | Phishing lấy console password, credential stuffing |

### 4. OWASP Cloud Top 10 (tóm tắt)

1. Access control kém (IAM quá quyền)
2. Misconfiguration
3. Insecure APIs
4. Thiếu patch / lộ secret
5. Giám sát & logging yếu
6. Dữ liệu không mã hoá (at rest/in transit)
7. Supply chain không an toàn
8. Quản lý danh tính yếu (MFA thiếu)
9. Denial of service
10. Shadow IT / tài nguyên không quản lý

> [!WARNING]
> Toàn bộ mục trên là **LÝ THUYẾT** giáo trình CEH. Không scan/quét cloud account không phải của bạn. Nếu bạn có tài khoản cloud, chỉ audit account của chính mình (hoặc dùng tài khoản lab miễn phí).

### 5. Phòng Thủ Cloud

- **Quy tắc IAM tối thiểu (least privilege)** + MFA bắt buộc + key xoay định kỳ.
- **Không public bucket** mặc định; **block public access** khi không cần; kiểm tra ACL/IAM policy.
- **Log & monitor:** CloudTrail, GuardDuty, alert khi có hành động lạ (như Tuần 12).
- **Mã hoá** dữ liệu at-rest (KMS) và in-transit (TLS).
- **Network:** security group hẹp, VPC riêng, không mở toàn bộ port ra internet.
- **Quét cấu hình định kỳ** bằng Prowler/ScoutSuite/`--audit` ở Lab 1.

---

## Cảnh Báo An Toàn & Đạo Đức / Safety & Ethics

> [!WARNING]
> 1. Lab tuần này **offline hoàn toàn** — không gọi bất kỳ API cloud nào, không quét account của ai.
> 2. Nếu bạn có tài khoản AWS/Azure/GCP, chỉ dùng **tài khoản lab cá nhân** và xoá tài nguyên sau khi xong. Dùng cloud người khác để quét = phạm pháp.
> 3. Không commit access key thật lên git — bài tập dùng **key giả**.
> 4. Vi phạm = **FAIL toàn bộ khoá học**.

---

## Thực Học Code / Hands-On (Defensive-first)

> Code đầy đủ trong `CODE/week19_cloud_audit.py`. Tool phòng thủ gồm:
> - Quét thư mục config/code tìm **access key / secret / token cloud lộ** (AKIA..., AWS secret, API key).
> - In **audit checklist IaaS** theo OWASP Cloud Top 10.
> - Giải thích **shared responsibility** nhanh theo mô hình (IaaS/PaaS/SaaS).

### Lab 1: Quét secret cloud bị lộ (Python)

Tạo file config giả rồi quét:

```bash
mkdir -p /tmp/cloudscan && cat > /tmp/cloudscan/aws.env <<'EOF'
AWS_ACCESS_KEY_ID=AKIA1234567890ABCDEF
AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG+bPxRfiCYEXAMPLEKEY
DB_HOST=localhost
EOF
python3 CODE/week19_cloud_audit.py --scan /tmp/cloudscan
python3 CODE/week19_cloud_audit.py --responsibility saas
python3 CODE/week19_cloud_audit.py --checklist
```

Kết quả mẫu:

```
[SCAN]  /tmp/cloudscan/aws.env:1 [!] ACCESS KEY cloud (AKIA...)
[SCAN]  /tmp/cloudscan/aws.env:2 [!] AWS SECRET key
[KẾT LUẬN] 2 secret lộ — NGUY HIỂM: kẻ khác có thể dùng để truy cập tài
           nguyên cloud của bạn. Xoá khỏi file, xoay key (revoke) ngay.
```

> **Giải thích CEH:** kẻ tấn công quét GitHub/`grep` bằng pattern `AKIA...` để tìm access key bị commit. Khi có key → gọi API cloud → **đọc/xoá/thay đổi tài nguyên** của bạn (instance takeover). Phòng thủ: **mã hoá secret**, dùng IAM role/secret manager, xoay key.

### Lab 2: Shared Responsibility (giải thích nhanh)

```bash
python3 CODE/week19_cloud_audit.py --responsibility iaas
python3 CODE/week19_cloud_audit.py --responsibility saas
```

Kết quả mẫu (IaaS):

```
[MÔ HÌNH] IaaS (EC2/VM tự quản)
  CSP:  hạ tầng vật lý, hypervisor, mạng data center
  BẠN:  OS, patch, firewall guest, IAM, dữ liệu, encryption
=> Hầu hết lỗi bảo mật trong IaaS do CẤU HÌNH phía bạn.
```

---

## Bài Tập Về Nhà / Homework

1. **Scanner:** tạo 2 file (1 lộ key, 1 sạch), chạy `--scan`, nộp kết quả + giải thích hậu quả khi key lộ.
2. **3 mô hình dịch vụ:** bảng IaaS/PaaS/SaaS — bạn quản lý gì, CSP quản lý gì; ví dụ thực tế.
3. **Vector:** chọn 3 vector cloud (misconfig, credential leak, insecure API, instance takeover, insider, supply chain) — giải thích + phòng thủ.
4. **Shared responsibility:** lấy 1 kịch bản (VD: S3 hở do config sai) — chỉ rõ ai chịu trách nhiệm, cách phòng.

---

## Rubric Đánh Giá Tuần 19

| Tiêu chí | Xuất sắc (90-100%) | Khá (70-89%) | Yếu (<70%) |
|----------|--------------------|--------------|------------|
| **Secret scanner** | 2 file + giải thích hậu quả (40đ) | 1 file, thiếu giải thích (25đ) | Không chạy (10đ) |
| **IaaS/PaaS/SaaS** | Đủ 3 mô hình + ví dụ đúng (30đ) | 2 mô hình (20đ) | Sai khái niệm (5đ) |
| **3 vector + responsibility** | Giải thích + kịch bản đúng (30đ) | Thiếu 1 phần (20đ) | Chép lại (5đ) |

---

## Checklist Đầu Ra Tuần 19

- [ ] Phân biệt IaaS/PaaS/SaaS và public/private/hybrid
- [ ] Giải thích shared responsibility model — ranh giới trách nhiệm
- [ ] Liệt kê 6+ vector tấn công cloud (misconfig, key leak, API, takeover, insider, supply chain)
- [ ] Nêu các mục trong OWASP Cloud Top 10
- [ ] Chạy thành công `week19_cloud_audit.py --scan`, `--responsibility`, `--checklist`
- [ ] Nêu 6 countermeasures (IAM tối thiểu, MFA, block public, log, mã hoá, quét cấu hình)
