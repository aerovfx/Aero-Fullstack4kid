# Tuần 5: Codec và tính băng thông

## Mục tiêu

- So sánh G.711 và G.729 theo chất lượng, CPU và bitrate.
- Tính băng thông thực gồm header và packetization.
- Lập capacity plan có headroom và traffic nền.

## Video nguồn

Bài 10–11: codec và cách tính bandwidth mỗi cuộc gọi.

## Công thức

```text
packets_per_second = 1000 / packetization_ms
packet_bytes = payload_bytes + IP_UDP_RTP_header + L2_overhead
bandwidth_bps = packets_per_second * packet_bytes * 8
total = bandwidth_per_call * concurrent_calls
```

Ví dụ G.711 20 ms tạo 50 packet/s với 160 byte payload; chỉ tính payload là 64 kbps, nhưng băng thông trên đường truyền cao hơn do RTP/UDP/IP và Layer 2. Nếu dùng cRTP, VPN hoặc MPLS, overhead thay đổi.

## Lab

Lập bảng cho G.711/G.729 ở 20 ms và 30 ms, sau đó tính số cuộc gọi đồng thời trên WAN 2 Mbps với tối đa 70% dành cho voice.

## Kiểm chứng

Không chỉ đo throughput: ghi latency, jitter, packet loss và MOS/R-factor nếu công cụ hỗ trợ. Giải thích vì sao đủ băng thông trung bình vẫn có thể nghe giật.

