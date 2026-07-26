from scapy.all import sniff, IP, TCP, Raw

def packet_callback(packet):
    """
    Hàm gọi lại xử lý các gói tin bắt được
    Callback function to process sniffed packets
    """
    if packet.haslayer(IP):
        ip_src = packet[IP].src
        ip_dst = packet[IP].dst
        
        if packet.haslayer(TCP):
            sport = packet[TCP].sport
            dport = packet[TCP].dport
            
            # Kiểm tra xem gói tin có chứa dữ liệu tải (Raw Payload) không
            # Check if packet contains a raw data payload
            if packet.haslayer(Raw):
                payload = packet[Raw].load.decode('utf-8', errors='ignore')
                
                # Tìm kiếm các từ khóa đăng nhập nhạy cảm (truyền không mã hóa)
                # Search for sensitive cleartext credentials keywords
                keywords = ["username", "password", "user", "pass", "login"]
                if any(kw in payload.lower() for kw in keywords):
                    print(f"\n[!] CẢNH BÁO BẢO MẬT / SECURITY WARN: Dữ liệu đăng nhập nhạy cảm dạng rõ!")
                    print(f"[*] Nguồn / Source: {ip_src}:{sport} -> Đích / Dest: {ip_dst}:{dport}")
                    print(f"[*] Nội dung gói tin / Packet data: {payload.strip()}\n")

if __name__ == "__main__":
    print("[*] Đang khởi động trình bắt gói tin... (Yêu cầu quyền Admin/Root)")
    print("[*] Sniffer running... (Requires Admin/Root privileges)")
    # Bắt gói tin TCP (sniffing 20 gói tin làm ví dụ)
    # Sniffing TCP packets (sniffing 20 packets for example)
    sniff(filter="tcp", prn=packet_callback, store=0, count=20)
