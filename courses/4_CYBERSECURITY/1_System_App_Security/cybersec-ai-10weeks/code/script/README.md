# mini_nmap - Cong cu quet mang toi gian kieu nmap

⚠️ **CHI dung tren he thong/mang ban so huu hoac da duoc cap phep ro rang.**

## Cai dat
Chi can Python 3.10+ (chuan, khong can cai them thu vien nao cho phase 1-5).
Phase 6 (SYN scan) can cai them: `pip install scapy` va chay voi quyen root.

## Cau truc
| File | Phase | Chuc nang |
|---|---|---|
| discovery.py | 1 | Do host song trong subnet (ICMP + TCP ping fallback) |
| port_scanner.py | 2 | Quet cong TCP connect scan, da luong |
| service_detect.py | 3 | Banner grabbing, nhan dien service |
| output.py | 4 | Xuat bang terminal / JSON / CSV |
| mini_nmap.py | 5 | CLI chinh, ghep tat ca cac phase |
| syn_scanner.py | 6 (mo rong) | SYN scan bang scapy, can root |

## Vi du dung (ban 5 file, mini_nmap.py)
```bash
# Quet 1 host, dai cong mac dinh 1-1024
python3 mini_nmap.py -t 192.168.1.10

# Quet ca dai mang, chi do host song
python3 mini_nmap.py -t 192.168.1.0/24 --discover-only

# Quet cong cu the, xuat JSON
python3 mini_nmap.py -t 192.168.1.10 -p 22,80,443,3306 -o json --out result.json

# Quet nhanh, bo qua nhan dien service
python3 mini_nmap.py -t 192.168.1.10 -p 1-65535 --no-service --threads 500
```

## nmap.sh - ban gop 1 file (khuyen dung)
`nmap.sh` la ban dong goi toan bo logic tren (Phase 1-4 + Phase 6 SYN scan)
thanh 1 file bash duy nhat, chi can Python 3 co san, khong can file .py rieng.

```bash
chmod +x nmap.sh

# Connect scan mac dinh (khong can root)
./nmap.sh -t 192.168.1.10 -p 1-1024

# Do host song trong dai mang
./nmap.sh -t 192.168.1.0/24 --discover-only

# Xuat JSON
./nmap.sh -t 192.168.1.10 -p 22,80,443 -o json --out result.json

# SYN scan (can root + pip install scapy; neu thieu se TU DONG
# fallback ve connect scan, khong crash)
sudo ./nmap.sh -t 192.168.1.10 -p 1-1024 --scan-type syn
```

### Tat ca cac co (flags)
| Co | Y nghia | Mac dinh |
|---|---|---|
| `-t, --target` | IP/hostname/CIDR | (bat buoc) |
| `-p, --ports` | vd `22,80` hoac `1-1024` | `1-1024` |
| `--discover-only` | chi do host song | tat |
| `--scan-type` | `connect` hoac `syn` | `connect` |
| `--no-service` | bo qua banner grabbing | tat |
| `--timeout` | giay/ket noi | `0.8` |
| `--threads` | so thread song song | `200` |
| `-o, --output-format` | `table`/`json`/`csv` | `table` |
| `--out` | duong dan file xuat | - |
