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

print("Ma trận A / Matrix A:\n", A)
print("Ma trận B / Matrix B:\n", B)

# Nhân ma trận (Matrix Multiplication)
C = np.dot(A, B)
print("\nTích ma trận C / Dot Product:\n", C)

# Tính toán các chỉ số thống kê trên ma trận C
mean_val = np.mean(C)
std_dev = np.std(C)

print(f"\nGiá trị trung bình / Mean: {mean_val:.2f}")
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
print("Dữ liệu gốc / Original DataFrame:\n", df)

# 1. Làm sạch: Điền khuyết giá trị trung bình cho cột revenue
mean_revenue = df['revenue'].mean()
df['revenue'] = df['revenue'].fillna(mean_revenue)

# 2. Điền khuyết dữ liệu phân loại bằng chuỗi mặc định
df['category'] = df['category'].fillna('Unknown')

# 3. Tính tổng doanh thu theo từng danh mục (GroupBy & Sum)
summary = df.groupby('category')['revenue'].sum().reset_index()
print("\nBáo cáo doanh số / Sales Report by Category:\n", summary)
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
  {
    id: "sec-ai-scanner",
    title: "AI-Powered Source Code Auditor",
    language: "python",
    description: "Script Python tích hợp API quét mã nguồn lỗi logic và đề xuất bản vá an toàn theo chuẩn OWASP.",
    code: `import os
import requests
import json

API_KEY = os.getenv("GEMINI_API_KEY", "MOCK_KEY")
API_URL = f"https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key={API_KEY}"

def audit_code(code):
    prompt = f"""
Bạn là chuyên gia rà soát mã nguồn bảo mật (Secure Code Reviewer).
Phân tích đoạn mã sau và chỉ ra các lỗ hổng (Buffer Overflow, SQLi, v.v.).
Trả về JSON duy nhất:
{{
  "has_vuln": true/false,
  "vulnerability": "Tên lỗi",
  "explanation": "Chi tiết lỗi",
  "fix": "Mã code đã sửa lỗi"
}}
Mã nguồn:
{code}
"""
    payload = {"contents": [{"parts": [{"text": prompt}]}]}
    res = requests.post(API_URL, json=payload)
    return res.json()

# Ví dụ chạy test với mã nguồn C++ có lỗi strcpy
bad_code = "void copy(char* src) { char dest[10]; strcpy(dest, src); }"
print("[*] Đang gửi mã nguồn cho AI quét bảo mật...")
# response = audit_code(bad_code)
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
  }
];
