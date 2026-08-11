#!/usr/bin/env python3
"""week18_iot_audit.py — IoT / OT Security Audit Toolkit (BLUE TEAM)

Tuan 18 - CEH Module 18 (IoT and OT Hacking).

Cong cu PHONG THU (offline, khong ket noi thiet bi):
  1) Kiem tra credential cua thiet bi IoT co nam trong danh sach credential
     mac dinh / da lo (kieu Mirai botnet) khong.
  2) Nhan nhac bao mat cho topic MQTT (ACL + TLS).
  3) In checklist bao mat IoT/OT.

[ETIKA - DOC TRUOC KHI CHAY]
  - Tool chi phan tich chuoi ban tu nhap, KHONG quet mang, KHONG ket noi
    broker/thiet bi nao. TUYET DOI khong dung voi thiet bi OT/PLC/SCADA that.
"""
import argparse

KNOWN_DEFAULT_CREDS = [
    "admin:admin", "admin:password", "admin:12345", "admin:123456",
    "root:root", "root:123456", "root:toor", "root:admin",
    "user:user", "test:test", "guest:guest", "support:support",
    "pi:raspberry", "ubnt:ubnt", "supervisor:supervisor",
    "admin:", "root:", "camera:camera", "telnet:telnet",
]

WEAK_CHECKS = [
    lambda u, p: len(p) < 8,
    lambda u, p: p.lower() == u.lower(),
    lambda u, p: p.isdigit(),
    lambda u, p: p.lower() in ("password", "12345678", "qwerty123", "letmein"),
]

CHECKLIST = [
    "Đổi credential mặc định ngay khi bóc máy + tắt port không dùng",
    "IoT/OT nằm trong VLAN riêng, có firewall/gateway ngăn cách IT/OT",
    "MQTT over TLS (8883) + auth + ACL topic (chống subscribe trộm)",
    "Firmware cập nhật khi có thể + asset inventory đầy đủ",
    "Giám sát bất thường lưu lượng tới thiết bị",
    "(OT) air-gap / data diode + đào tạo vận hành an toàn",
    "Đánh giá theo OWASP Top 10 IoT định kỳ",
]


def cred_check(user: str, password: str):
    print("=" * 60)
    print("IOT CREDENTIAL AUDITOR (BLUE TEAM)")
    print("=" * 60)
    cred = f"{user}:{password}"
    print(f"[CRED]  {cred}")

    if cred.lower() in KNOWN_DEFAULT_CREDS:
        print(f"[!] ĐÂY LÀ CREDENTIAL MẶC ĐỊNH / ĐÃ LỘ — thuộc danh sách "
              f"botnet Mirai.")
        print("    ĐỔI NGAY trước khi thiết bị bị quét & chiếm (Mirai quét "
              "toàn internet bằng danh sách này).")
        return

    weak = [r for r in WEAK_CHECKS if r(user, password)]
    if weak:
        print(f"[!] MẬT KHẨU YẾU ({len(weak)} dấu hiệu): ngắn/dễ đoán/lặp user.")
        print("    Botnet sẽ thử được trong thời gian ngắn.")
    else:
        print(f"[OK]   Không nằm trong danh sách đã lộ.")
        print("    Vẫn nhắc: đổi định kỳ, không dùng chung giữa các thiết bị.")

    print("=" * 60)
    print("KHUYẾN NGHỊ: user/pass duy nhất cho từng thiết bị, mật khẩu "
          ">= 12 ký tự, không phải từ điển.")


def topic_check(topic: str):
    print("=" * 60)
    print("MQTT TOPIC HEURISTIC (BLUE TEAM)")
    print("=" * 60)
    print(f"[TOPIC] {topic}")

    risks = []
    seg = topic.strip("/").split("/")
    if len(seg) > 1:
        risks.append("nhiều cấp — kiểm tra ACL từng cấp")
    for word in ("live", "stream", "control", "admin", "lock", "private", "secret"):
        if word in topic.lower():
            risks.append(f"từ '{word}' gợi ý dữ liệu nhạy cảm/điều khiển")
    if topic.startswith(("$SYS", "device", "app")):
        risks.append("phạm vi rộng — dễ subscribe trộm nếu ACL yếu")

    print("[Nhắc nhở] Topic chỉ là 'đường dẫn', KHÔNG phải bảo mật:")
    print("   - Phải dùng MQTT over TLS (port 8883), không phải 1883 trần")
    print("   - Broker cần auth + ACL topic (không cho client lạ subscribe)")
    print("   - Dữ liệu nhạy cảm nên mã hoá end-to-end (ngoài phạm vi broker)")
    if risks:
        print(f"   - Lưu ý topic này: {', '.join(risks)}.")


def checklist():
    print("=" * 60)
    print("IOT/OT SECURITY CHECKLIST (BLUE TEAM)")
    print("=" * 60)
    for item in CHECKLIST:
        print(f" [ ] {item}")
    print("=" * 60)
    print("Hướng dẫn: tự đánh giá hệ thống của CHÍNH BẠN.")


def main():
    ap = argparse.ArgumentParser(description="IoT/OT audit toolkit (offline)")
    ap.add_argument("--cred", metavar="user:pass", help="credential cần kiểm tra")
    ap.add_argument("--topic", metavar="TOPIC", help="topic MQTT cần đánh giá")
    ap.add_argument("--checklist", action="store_true", help="in checklist")
    args = ap.parse_args()

    if args.cred:
        if ":" in args.cred:
            u, p = args.cred.split(":", 1)
            cred_check(u, p)
        else:
            print("[LỖI] Dùng định dạng user:pass, VD --cred admin:admin")
    elif args.topic:
        topic_check(args.topic)
    elif args.checklist:
        checklist()
    else:
        ap.print_help()
        print("\nVD: python3 CODE/week18_iot_audit.py --cred admin:admin")


if __name__ == "__main__":
    main()
