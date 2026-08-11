# GIÁO ÁN CEH v13 — ĐÚNG 20 TUẦN

## 1. Thông tin học phần

| Thuộc tính | Nội dung |
|---|---|
| Tên học phần | Ethical Hacking & Penetration Testing theo CEH v13 |
| Thời lượng | **20 tuần**, 1 buổi/tuần, 6 tiết/buổi (ước tính 300 phút) |
| Tổng thời lượng | 120 tiết |
| Đối tượng | Sinh viên CNTT/ATTT đã biết mạng máy tính, Linux và Python căn bản |
| Giáo trình chính | 20 bài Markdown trong `lessons/`, ánh xạ một-một với 20 module CEH v13 |
| Phương pháp | Defensive-first, học theo tình huống, demo có hướng dẫn, lab cách ly, viết báo cáo |
| Môi trường | Kali Linux VM; Windows/Linux VM; localhost; Metasploitable/DVWA/Juice Shop trong mạng host-only |
| Ngôn ngữ | Giảng dạy tiếng Việt, thuật ngữ chuyên môn tiếng Anh |

> Giả định lịch học là 6 tiết/tuần. Nếu cơ sở đào tạo dùng 3 tiết/tuần, giữ nguyên 20 tuần nhưng chuyển phần lab còn lại thành bài tự học có giám sát.

## 2. Mục tiêu đầu ra

Hoàn thành học phần, học viên có thể:

1. Giải thích quy trình ethical hacking, mô hình đe dọa và yêu cầu pháp lý trước khi kiểm thử.
2. Thực hiện trinh sát, quét, enumeration và đánh giá lỗ hổng trong phạm vi lab được cấp phép.
3. Phân tích rủi ro đối với hệ điều hành, mạng, web, không dây, mobile, IoT/OT và cloud.
4. Thu thập bằng chứng, ưu tiên phát hiện và viết khuyến nghị khắc phục có thể kiểm chứng.
5. Sử dụng công cụ và script phòng thủ một cách an toàn, tái lập được và có nhật ký.
6. Trình bày một báo cáo kiểm thử gồm phạm vi, phương pháp, phát hiện, bằng chứng, mức độ rủi ro và remediation.

## 3. Chuẩn an toàn bắt buộc

- Mọi hoạt động phải có phạm vi và quyền bằng văn bản; mặc định chỉ được dùng `127.0.0.1`, VM và mạng host-only của lớp.
- Không quét IP công cộng, không thu thập thông tin cá nhân thật, không gửi phishing thật, không gây DoS và không triển khai mã độc.
- Snapshot VM trước lab; tắt bridged networking; dùng dữ liệu giả; xóa secret và token khỏi báo cáo.
- Các tuần 6–12 chỉ mô phỏng kỹ thuật tấn công hoặc phân tích dấu hiệu; trọng tâm là phát hiện và khắc phục.
- Vi phạm phạm vi: dừng lab ngay, cô lập máy, bảo toàn log và báo giảng viên.

## 4. Cấu trúc chuẩn của một buổi 300 phút

| Hoạt động | Thời lượng | Cách tổ chức |
|---|---:|---|
| Khởi động và kiểm tra bài cũ | 20 phút | Quiz 5 câu + chữa nhanh |
| Lý thuyết trọng tâm | 70 phút | Giảng ngắn, sơ đồ, tình huống |
| Demo của giảng viên | 35 phút | Think-aloud, chỉ trong lab |
| Nghỉ | 10 phút | — |
| Thực hành có hướng dẫn | 90 phút | Theo cặp, checklist an toàn |
| Phân tích và viết bằng chứng | 45 phút | Ảnh/log/JSON + remediation |
| Trình bày, exit ticket | 30 phút | Peer review và giao bài |

## 5. Kế hoạch giảng dạy đúng 20 tuần

| Tuần | Module/sách | Kết quả học tập trong tuần | Hoạt động dạy và học | Lab được phép | Minh chứng/đánh giá |
|---:|---|---|---|---|---|
| 1 | M01 — Introduction to Ethical Hacking | Phân biệt hacker; giải thích CIA, 5 pha hacking, Kill Chain; lập RoE | Phân tích tình huống, lập scope và threat model | Audit cổng rủi ro trên localhost bằng `week01_security_audit.py` | RoE 1 trang, JSON audit, quiz đạo đức |
| 2 | M02 — Footprinting and Reconnaissance | Phân biệt passive/active recon; lập inventory dữ liệu công khai | GV mô hình hóa footprint; nhóm phân loại nguồn và rủi ro lộ lọt | Phân tích domain/dữ liệu giả hoặc tài sản do lớp sở hữu bằng `week02_footprint_audit.py` | Footprint report + 5 khuyến nghị giảm exposure |
| 3 | M03 — Scanning Networks | Đọc TCP flags; giải thích host discovery, port/service scan và false positive | Sơ đồ TCP handshake; so sánh kết quả quét với service thật | Quét localhost/mạng host-only bằng `week03_defensive_port_audit.py` | Bảng port–service–risk–remediation |
| 4 | M04 — Enumeration | Giải thích DNS/SMB/SNMP/LDAP enumeration và giới hạn quyền | Phân loại artifact; thảo luận dấu hiệu enumeration trong log | Kiểm kê dịch vụ lab với `week04_enumeration_audit.py` | Evidence log + hardening checklist |
| 5 | M05 — Vulnerability Analysis | Phân biệt vulnerability/threat/risk; đọc CVE, CVSS; ưu tiên remediation | Chấm CVSS theo case; đối chiếu scanner với xác minh thủ công | Tra cứu dữ liệu CVE mẫu/offline bằng `week05_cve_lookup.py` | Vulnerability register 5 mục + ưu tiên xử lý |
| 6 | M06 — System Hacking | Mô tả authentication attack, privilege escalation, persistence và log evidence ở mức khái niệm | Điều tra chuỗi sự kiện giả; map control phòng thủ | Đánh giá độ mạnh mật khẩu do lớp tự tạo bằng `week06_password_strength.py` | Chính sách mật khẩu + báo cáo phát hiện |
| 7 | M07 — Malware Threats | Phân loại malware; nhận diện IOC; thực hiện static triage an toàn | Phân tích hash/metadata/strings từ mẫu vô hại | Triage file tự tạo bằng `week07_malware_triage.py`; không chạy malware | Phiếu IOC + quy trình cô lập/ứng phó |
| 8 | M08 — Sniffing | Giải thích ARP, MAC, packet capture và rủi ro cleartext | Đọc PCAP mẫu; phân biệt traffic bình thường/bất thường | Theo dõi ARP trong mạng lab với `week08_arp_monitor.py` | Chú giải PCAP + biện pháp chống sniffing |
| 9 | M09 — Social Engineering | Nhận diện pretext, phishing, baiting; thiết kế biện pháp con người/quy trình | Role-play nhận diện, không gửi thông điệp ra ngoài | Phân tích URL giả bằng `week09_phishing_url_analyzer.py` | Phân tích 10 URL mẫu + playbook báo cáo phishing |
| 10 | M10 — Denial-of-Service | Phân biệt DoS/DDoS, amplification, resource exhaustion; chọn chỉ báo giám sát | Tabletop ứng phó; **kiểm tra giữa kỳ M01–M10** | Monitor tải cục bộ bằng `week10_dos_defense_monitor.py`; không phát sinh flood | Bài thi giữa kỳ + dashboard/chỉ báo và runbook |
| 11 | M11 — Session Hijacking | Giải thích session ID, cookie flags, fixation/hijacking và biện pháp bảo vệ | Phân tích HTTP trace giả; sửa cấu hình cookie | Audit cookie/header của ứng dụng lab bằng `week11_cookie_analyzer.py` | Bảng lỗi cookie + cấu hình khắc phục |
| 12 | M12 — Evading IDS, Firewalls, and Honeypots | Hiểu các kiểu né tránh ở mức phòng thủ; thiết kế defense-in-depth | So sánh rule tốt/xấu; đọc alert và false positive | Chạy rule engine trên log mẫu bằng `week12_ids_rule_engine.py` | 5 rule phát hiện + phân tích false positive |
| 13 | M13 — Hacking Web Servers | Nhận diện misconfiguration, banner leakage, TLS/header yếu | Hardening review theo checklist | Quét web server local bằng `week13_header_scanner.py` | Baseline cấu hình + remediation có kiểm chứng |
| 14 | M14 — Hacking Web Applications | Mô tả OWASP-style flaws, input validation, auth và business logic | Threat modeling luồng web; code review có hướng dẫn | Kiểm tra input của DVWA/Juice Shop local bằng `week14_input_scanner.py` | DFD/threat model + 3 finding cards |
| 15 | M15 — SQL Injection | Giải thích nguyên nhân SQLi; dùng parameterized query; nhận biết dấu hiệu trong log | So sánh nối chuỗi với prepared statement | Chạy demo phòng thủ local bằng `week15_sqli_defender.py` | Bản vá tham số hóa + unit test + log evidence |
| 16 | M16 — Hacking Wireless Networks | Phân biệt chuẩn 802.11, WPA2/WPA3, evil twin và hardening | Thiết kế WLAN doanh nghiệp; phân tích capture được cung cấp | Audit cấu hình giả/offline bằng `week16_wifi_audit.py`; không deauth/crack | WLAN security assessment |
| 17 | M17 — Hacking Mobile Platforms | Nhận diện rủi ro permission, storage, transport, signing và secret | Review manifest/config mẫu; lập mobile threat model | Static scan thư mục ứng dụng mẫu bằng `week17_mobile_scanner.py` | Mobile finding report + remediation |
| 18 | M18 — IoT and OT Hacking | Phân biệt IT/OT; nhận diện firmware/default credential/insecure protocol; đề xuất segmentation | Tabletop an toàn vận hành; vẽ zone/conduit | Audit inventory giả bằng `week18_iot_audit.py` | Sơ đồ phân vùng + risk register OT/IoT |
| 19 | M19 — Cloud Computing | Giải thích shared responsibility, IAM, storage exposure, logging và secret management | Review kiến trúc/IAM policy giả; tabletop cloud incident | Audit cấu hình offline bằng `week19_cloud_audit.py` | Cloud posture report + least-privilege policy |
| 20 | M20 — Cryptography | Phân biệt symmetric/asymmetric/hash; giải thích PKI/TLS, salt/KDF và vòng đời khóa | Ôn tích hợp 20 module; bảo vệ dự án | Hash/salt/crypto demo bằng `week20_crypto_toolkit.py`; không bẻ khóa | Quiz tổng hợp, báo cáo capstone và bảo vệ |

## 6. Chuẩn bị chi tiết theo tuần

Mỗi tuần, giảng viên dùng các nguồn ưu tiên Markdown sau:

1. Bài giảng `lessons/weekNN.md` để xác nhận thuật ngữ, dạy lý thuyết, demo, bài tập và rubric.
2. Giáo án này để kiểm soát tiến độ, chuẩn đầu ra và đánh giá.
3. Script `CODE/weekNN_*.py` làm lab phòng thủ; tuần 3 ưu tiên `week03_defensive_port_audit.py`.

Trước buổi học, giảng viên phải:

- chạy thử script trong VM sạch và ghi lại phiên bản Python/phụ thuộc;
- xác nhận target được hard-code hoặc giới hạn vào localhost/mạng host-only;
- chuẩn bị snapshot, dữ liệu giả, đáp án quiz và kết quả mẫu;
- kiểm tra rubric tuần trong `lessons/weekNN.md`;
- công bố rõ “được làm / không được làm / dừng khi nào”.

## 7. Đánh giá học phần

| Thành phần | Trọng số | Quy tắc chấm |
|---|---:|---|
| Lab tuần 1–15 | 30% | Chọn 10 bài tốt nhất, mỗi bài chấm evidence 40%, phân tích 30%, remediation 30% |
| Giữa kỳ tuần 10 | 15% | 40 câu M01–M10 (10%) + tabletop DoS (5%) |
| Lab chuyên đề tuần 16–19 | 20% | Mỗi tuần 5%; yêu cầu sản phẩm đúng chuyên ngành |
| Capstone tuần 20 | 25% | Scope 10%, phương pháp 15%, findings/evidence 30%, remediation 25%, bảo vệ 20% |
| Chuyên cần, đạo đức, nhật ký | 10% | Có nhật ký tái lập; tuân thủ phạm vi là điều kiện bắt buộc |

### Rubric chung cho một phát hiện

| Mức | Mô tả |
|---|---|
| Xuất sắc | Có phạm vi, bước tái lập an toàn, bằng chứng, tác động, mức rủi ro, nguyên nhân, remediation và retest |
| Đạt | Có bằng chứng và remediation nhưng thiếu một phần phân tích hoặc retest |
| Chưa đạt | Không tái lập được, không chứng minh tác động, hoặc vượt phạm vi |

## 8. Capstone cuối khóa

Học viên làm theo nhóm 2–3 người trên một hệ thống lab do giảng viên cấp. Sản phẩm gồm:

- Authorization/Rules of Engagement và sơ đồ phạm vi;
- asset inventory và threat model;
- tối thiểu 5 phát hiện đã xác minh, không tính scanner output chưa kiểm tra;
- bằng chứng đã che secret/PII;
- remediation ưu tiên theo rủi ro và kết quả retest;
- báo cáo 12–20 trang và phần bảo vệ 12 phút.

Không yêu cầu khai thác phá hoại, persistence, credential dumping, DoS, phishing thật hay né tránh kiểm soát.

## 9. Ma trận nguồn học liệu

Toàn bộ 20 tuần ánh xạ một-một: tuần 01 dùng Module 01, …, tuần 20 dùng Module 20. Bài giảng Markdown trong `lessons/` là nguồn chuẩn của giáo án; code nằm trong `CODE/`. Repository không lưu PDF để giảm dung lượng và tránh trùng lặp nội dung.

## 10. Kiểm soát chất lượng trước khi mở lớp

- [ ] Đủ chính xác 20 tuần và không ghép/bỏ module.
- [ ] Mọi file Markdown `week01`–`week20` và script tương ứng tồn tại.
- [ ] Mọi lab có target được phép, dữ liệu giả và cách dừng khẩn cấp.
- [ ] Có quiz/exit ticket, rubric và đầu ra quan sát được cho từng tuần.
- [ ] Giữa kỳ ở tuần 10; capstone và bảo vệ ở tuần 20.
- [ ] Giảng viên rà lại pháp luật, chính sách tổ chức và phiên bản CEH trước ngày khai giảng.
