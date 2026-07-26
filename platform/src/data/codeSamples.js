export const codeSamples = [
  // --- FRONT-END SAMPLES ---
  {
    id: "fe-html-profile",
    title: "HTML5 & CSS3 Profile Page",
    language: "html",
    description: "Trang thông tin cá nhân đơn giản sử dụng HTML5 semantic và CSS3 Box Model để bố cục giao diện.",
    code: `<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Hồ Sơ Cá Nhân / Profile</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f9;
      margin: 0;
      padding: 0;
    }
    .profile-card {
      max-width: 400px;
      margin: 50px auto;
      background: white;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
      padding: 20px;
      text-align: center;
    }
    .avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      background: #ddd;
      margin: 0 auto 15px;
    }
    .name {
      font-size: 1.5em;
      color: #333;
      margin-bottom: 5px;
    }
    .bio {
      color: #777;
      font-size: 0.9em;
    }
  </style>
</head>
<body>
  <div class="profile-card">
    <div class="avatar"></div>
    <h2 class="name">Nguyễn Văn A</h2>
    <p class="bio">Front-End Developer | Đam mê thiết kế và lập trình giao diện Web sáng tạo.</p>
  </div>
</body>
</html>
`
  },
  {
    id: "fe-react-counter",
    title: "React.js Dynamic Counter Hook",
    language: "javascript",
    description: "Component React sử dụng Hook useState để quản lý trạng thái bộ đếm tăng giảm tương tác.",
    code: `import React, { useState } from 'react';

export default function Counter() {
  const [count, setCount] = useState(0);

  return (
    <div style={{ padding: '20px', textAlign: 'center', border: '1px solid #ccc', borderRadius: '8px' }}>
      <h3>Bộ đếm React / React Counter</h3>
      <p style={{ fontSize: '24px', fontWeight: 'bold' }}>{count}</p>
      <div style={{ display: 'flex', gap: '10px', justifyContent: 'center' }}>
        <button onClick={() => setCount(count - 1)} style={{ padding: '8px 16px' }}>Giảm / -</button>
        <button onClick={() => setCount(0)} style={{ padding: '8px 16px' }}>Reset</button>
        <button onClick={() => setCount(count + 1)} style={{ padding: '8px 16px' }}>Tăng / +</button>
      </div>
    </div>
  );
}
`
  },

  // --- BACK-END SAMPLES ---
  {
    id: "be-express-router",
    title: "Express.js Router & Middleware Server",
    language: "javascript",
    description: "Khởi tạo API server bằng Express với Logger Middleware và Router phân cấp quản lý sản phẩm.",
    code: `const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

// Middleware logging yêu cầu truy cập hệ thống
app.use((req, res, next) => {
  console.log(\`[\${new Date().toISOString()}] \${req.method} \${req.url}\`);
  next();
});

app.use(express.json());

// Mock database
let products = [
  { id: 1, name: "Laptop", price: 1500 },
  { id: 2, name: "Phone", price: 800 }
];

// Router endpoints
app.get('/api/products', (req, res) => {
  res.json(products);
});

app.post('/api/products', (req, res) => {
  const newProduct = {
    id: products.length + 1,
    name: req.body.name,
    price: req.body.price
  };
  products.push(newProduct);
  res.status(201).json(newProduct);
});

app.listen(PORT, () => {
  console.log(\`Server running on port \${PORT}\`);
});
`
  },
  {
    id: "be-rust-axum",
    title: "Rust Axum Async HTTP APIs",
    language: "rust",
    description: "Máy chủ HTTP bất đồng bộ viết bằng Rust sử dụng Axum Framework và Tokio Runtime.",
    code: `use axum::{
    routing::{get, post},
    Json, Router, response::IntoResponse, http::StatusCode
};
use serde::{Deserialize, Serialize};
use std::net::SocketAddr;

#[derive(Deserialize, Serialize)]
struct User {
    id: u64,
    username: String,
}

// Handler trả về danh sách users dạng JSON
async fn get_users() -> impl IntoResponse {
    let users = vec![
        User { id: 1, username: "alice".to_string() },
        User { id: 2, username: "bob".to_string() }
    ];
    (StatusCode::OK, Json(users))
}

// Handler nhận JSON đăng ký user mới
async fn create_user(Json(payload): Json<User>) -> impl IntoResponse {
    // Xử lý lưu database tại đây...
    (StatusCode::CREATED, Json(payload))
}

#[tokio::main]
async fn main() {
    // Khởi tạo routing
    let app = Router::new()
        .route("/users", get(get_users))
        .route("/users", post(create_user));

    let addr = SocketAddr::from(([127, 0, 0, 1], 8080));
    println!("Server running on http://{}", addr);
    
    let listener = tokio::net::TcpListener::bind(addr).await.unwrap();
    axum::serve(listener, app).await.unwrap();
}
`
  },

  // --- SOFTWARE TOOLS SAMPLES ---
  {
    id: "dev-dockerfile",
    title: "Multi-stage Production Dockerfile",
    language: "dockerfile",
    description: "Dockerfile tối ưu sử dụng kỹ thuật multi-stage build để đóng gói ứng dụng Node.js gọn nhẹ cho môi trường production.",
    code: `# Stage 1: Build dependencies
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
# RUN npm run build (nếu có compile step)

# Stage 2: Production runner
FROM node:18-alpine AS runner
WORKDIR /app
ENV NODE_ENV=production
COPY package*.json ./
RUN npm prune --production
COPY --from=builder /app /app

EXPOSE 3000
CMD ["node", "src/main.js"]
`
  },
  {
    id: "dev-docker-compose",
    title: "Docker Compose Web & Database Setup",
    language: "yaml",
    description: "Cấu hình docker-compose.yml khởi chạy đồng thời container Web Node.js và CSDL MongoDB trong một mạng ảo cô lập.",
    code: `version: '3.8'

services:
  web:
    build: .
    ports:
      - "3000:3000"
    environment:
      - MONGO_URI=mongodb://db:27017/shopdb
    depends_on:
      - db
    networks:
      - app-network

  db:
    image: mongo:6.0
    ports:
      - "27017:27017"
    volumes:
      - mongodb_data:/data/db
    networks:
      - app-network

volumes:
  mongodb_data:

networks:
  app-network:
    driver: bridge
`
  },

  // --- DATA SCIENCE SAMPLES ---
  {
    id: "ds-numpy-matrix",
    title: "NumPy Matrix Multiplication & Stats",
    language: "python",
    description: "Thao tác trên mảng ma trận nhiều chiều của NumPy, nhân ma trận và tính toán độ lệch chuẩn, phân bố.",
    code: `import numpy as np

# Tạo hai mảng ma trận ngẫu nhiên 3x3
A = np.random.randint(1, 10, size=(3, 3))
B = np.random.randint(1, 10, size=(3, 3))

print("Ma trận A / Matrix A:\\n", A)
print("Ma trận B / Matrix B:\\n", B)

# Nhân ma trận (Matrix Multiplication)
C = np.dot(A, B)
print("\\nTích ma trận C / Dot Product:\\n", C)

# Tính toán các chỉ số thống kê trên ma trận C
mean_val = np.mean(C)
std_dev = np.std(C)

print(f"\\nGiá trị trung bình / Mean: {mean_val:.2f}")
print(f"Độ lệch chuẩn / Std Deviation: {std_dev:.2f}")

# Lọc dữ liệu bằng Boolean Indexing (Phần tử > trung bình)
filtered = C[C > mean_val]
print("Các phần tử lớn hơn trung bình / Elements > mean:", filtered)
`
  },
  {
    id: "ds-pandas-cleaning",
    title: "Pandas DataFrame Cleaning & GroupBy",
    language: "python",
    description: "Đọc file CSV, thực hiện lọc giá trị NaN, điền khuyết giá trị trung bình, và nhóm thống kê doanh số GroupBy.",
    code: `import pandas as pd
import numpy as np

# Tạo DataFrame mẫu giả lập dữ liệu bẩn
data = {
    'product_id': [101, 102, 103, 101, 102, 103],
    'category': ['Web', 'Mobile', 'AI', 'Web', 'Mobile', None],
    'revenue': [1500, None, 3000, 1200, 800, 2500]
}
df = pd.DataFrame(data)
print("Dữ liệu gốc / Original DataFrame:\\n", df)

# 1. Làm sạch: Điền khuyết giá trị trung bình cho cột revenue
mean_revenue = df['revenue'].mean()
df['revenue'] = df['revenue'].fillna(mean_revenue)

# 2. Điền khuyết dữ liệu phân loại bằng chuỗi mặc định
df['category'] = df['category'].fillna('Unknown')

# 3. Tính tổng doanh thu theo từng danh mục (GroupBy & Sum)
summary = df.groupby('category')['revenue'].sum().reset_index()
print("\\nBáo cáo doanh số / Sales Report by Category:\\n", summary)
`
  },

  // --- CYBERSECURITY & AI SAMPLES ---
  {
    id: "sec-port-scanner",
    title: "C++ High-Performance Port Scanner",
    language: "cpp",
    description: "Chương trình C++ quét cổng TCP đa luồng sử dụng socket, giới hạn luồng quét tránh làm nghẽn mạng.",
    code: `#include <iostream>
#include <vector>
#include <thread>
#include <mutex>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <unistd.h>

std::mutex console_mtx;
std::vector<int> open_ports;

void scan_port(const std::string& ip, int port) {
    int sock = socket(AF_INET, SOCK_STREAM, 0);
    if (sock < 0) return;

    sockaddr_in addr;
    addr.sin_family = AF_INET;
    addr.sin_port = htons(port);
    inet_pton(AF_INET, ip.c_str(), &addr.sin_addr);

    // Set connection timeout (500ms)
    struct timeval tv;
    tv.tv_sec = 0;
    tv.tv_usec = 500000;
    setsockopt(sock, SOL_SOCKET, SO_SNDTIMEO, (const char*)&tv, sizeof(tv));

    int result = connect(sock, (struct sockaddr*)&addr, sizeof(addr));
    close(sock);

    if (result == 0) {
        std::lock_guard<std::mutex> lock(console_mtx);
        std::cout << "[+] Cổng mở / Open port: " << port << std::endl;
        open_ports.push_back(port);
    }
}

int main() {
    std::string target = "127.0.0.1";
    std::vector<std::thread> threads;
    
    std::cout << "[*] Bắt đầu quét mạng / Scanning..." << std::endl;
    for (int port = 1; port <= 1024; ++port) {
        threads.push_back(std::thread(scan_port, target, port));
        if (threads.size() >= 50) {
            for (auto& t : threads) t.join();
            threads.clear();
        }
    }
    for (auto& t : threads) t.join();
    return 0;
}
`
  },

  // --- WEB3 & BLOCKCHAIN SAMPLES ---
  {
    id: "web3-solidity-bank",
    title: "Solidity Simple Bank Contract",
    language: "solidity",
    description: "Hợp đồng thông minh Solidity quản lý tài khoản ngân hàng phi tập trung cho phép nạp, rút và kiểm tra số dư an toàn.",
    code: `// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleBank {
    // Lưu trữ số dư của từng địa chỉ ví
    mapping(address => uint256) private balances;
    
    // Khai báo sự kiện nạp/rút tiền
    event Deposit(address indexed user, uint256 amount);
    event Withdraw(address indexed user, uint256 amount);

    // Hàm payable cho phép nhận ETH gửi lên hợp đồng
    function deposit() public payable {
        require(msg.value > 0, "So tien nạp phai lon hon 0");
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    // Hàm rút tiền có kiểm tra điều kiện an toàn
    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Khong du so du de rut");
        
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
        
        emit Withdraw(msg.sender, amount);
    }

    // Xem số dư của ví hiện tại
    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}
`
  },
  {
    id: "web3-rust-solana",
    title: "Solana Anchor Counter Program",
    language: "rust",
    description: "Hợp đồng thông minh viết bằng Rust trên blockchain Solana sử dụng Anchor Framework để tăng giảm trạng thái tài khoản Counter.",
    code: `use anchor_lang::prelude::*;

declare_id!("Fg6PaFpoGXkYsidMpWTK6W2BeZ7FEfcYkg476zPFsLnS");

#[program]
pub mod solana_counter {
    use super::*;

    // Hàm khởi tạo bộ đếm
    pub fn initialize(ctx: Context<Initialize>) -> Result<()> {
        let counter_account = &mut ctx.accounts.counter_account;
        counter_account.count = 0;
        counter_account.owner = *ctx.accounts.user.key;
        Ok(())
    }

    // Hàm tăng bộ đếm có kiểm tra phân quyền sở hữu
    pub fn increment(ctx: Context<Increment>) -> Result<()> {
        let counter_account = &mut ctx.accounts.counter_account;
        // Kiểm tra an toàn trước khi tăng tránh overflow
        counter_account.count = counter_account.count.checked_add(1).ok_or(error!(ErrorCode::MathOverflow))?;
        Ok(())
    }
}

#[derive(Accounts)]
pub struct Initialize<'info> {
    // Khởi tạo tài khoản Counter mới chi trả phí rent bởi user
    #[account(init, payer = user, space = 8 + 8 + 32)]
    pub counter_account: Account<'info, Counter>,
    #[account(mut)]
    pub user: Signer<'info>,
    pub system_program: Program<'info, System>,
}

#[derive(Accounts)]
pub struct Increment<'info> {
    // Ràng buộc chỉ cho phép Owner của Counter gọi hàm
    #[account(mut, has_one = owner)]
    pub counter_account: Account<'info, Counter>,
    pub owner: Signer<'info>,
}

#[account]
pub struct Counter {
    pub count: u64,
    pub owner: Pubkey,
}

#[error_code]
pub mod ErrorCode {
    #[msg("Phép tính bị tràn số / Math calculation overflow.")]
    MathOverflow,
}
`
  },
  {
    id: "sec-nmap-recon",
    title: "Nmap Scanning Commands Handbook",
    language: "bash",
    description: "Tổng hợp các câu lệnh dò quét cổng mạng, phát hiện dịch vụ và hệ điều hành thông dụng bằng Nmap.",
    code: `# 1. Quét nhanh 100 cổng phổ biến nhất (Fast scan)
nmap -F 192.168.56.101

# 2. Quét kiểm tra cổng mở sử dụng SYN Scan (Half-open)
nmap -sS 192.168.56.101

# 3. Quét phát hiện phiên bản dịch vụ và hệ điều hành mục tiêu
nmap -sV -O 192.168.56.101

# 4. Quét toàn bộ 65535 cổng mạng với tốc độ cao (T4)
nmap -p- -T4 192.168.56.101

# 5. Sử dụng Script kiểm tra lỗ hổng bảo mật dịch vụ (NSE Scripts)
nmap --script vuln 192.168.56.101
`
  },
  {
    id: "sec-hashcat-rules",
    title: "Hashcat Password Recovery Commands",
    language: "bash",
    description: "Bộ lệnh bẻ khóa mã băm mật khẩu MD5, SHA-256 sử dụng từ điển (Wordlist) và tấn công Brute-force với Hashcat.",
    code: `# 1. Bẻ khóa MD5 (Mode 0) sử dụng file từ điển rockyou.txt
hashcat -m 0 hash_md5.txt /usr/share/wordlists/rockyou.txt

# 2. Bẻ khóa SHA-256 (Mode 1400) sử dụng file từ điển
hashcat -m 1400 hash_sha256.txt /usr/share/wordlists/rockyou.txt

# 3. Tấn công Brute-force mật khẩu MD5 có 8 ký tự số
hashcat -m 0 -a 3 hash_md5.txt ?d?d?d?d?d?d?d?d

# 4. Kiểm tra danh sách thiết bị GPU hỗ trợ tăng tốc bẻ khóa
hashcat -I
`
  },
  {
    id: "sec-snort-rules",
    title: "Snort IDS Rules Configuration",
    language: "bash",
    description: "Các quy tắc cấu hình luật (rules) của Snort IDS để phát hiện hành vi quét mạng Nmap hoặc tấn công DoS ICMP.",
    code: `# 1. Cảnh báo khi phát hiện kết nối ICMP (Ping)
alert icmp any any -> $HOME_NET any (msg:"ICMP Ping scan detected"; sid:1000001; rev:1;)

# 2. Cảnh báo khi phát hiện quét cổng TCP SYN Scan (Nmap)
alert tcp any any -> $HOME_NET any (flags: S; msg:"TCP SYN scan activity detected"; sid:1000002; rev:1;)

# 3. Cảnh báo khi phát hiện lưu lượng truy cập HTTP chứa ký tự SQL Injection cơ bản
alert tcp any any -> $HOME_NET 80 (msg:"SQL Injection Attempt Detected"; content:"UNION SELECT"; nocase; sid:1000003; rev:1;)
`
  }
];
