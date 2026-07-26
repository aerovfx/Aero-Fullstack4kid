# 🎓 Học Viện Lập Trình Đa Khoá Học / Fullstack4kid Academy

Chào mừng bạn đến với **Fullstack4kid Academy** - Kho lưu trữ tài liệu học tập và nền tảng hiển thị giáo trình tương tác 10 tuần, bao gồm các chủ đề lập trình hiện đại từ Front-End, Back-End, Công cụ phát triển, Khoa học dữ liệu đến An ninh mạng và Công nghệ Web3/Blockchain.

---

## 🗺️ Bản Đồ Kiến Thức / Curriculum Map (8 Khoá Học 10 Tuần)

Hệ thống cung cấp 8 lộ trình học tập chuyên sâu được thiết kế khoa học trong 10 tuần:

| Phân Loại / Category | Khoá Học / Course Path | Nội Dung Chính / Core Topics |
|---|---|---|
| **1. Front-End** | [HTML, CSS, JS & React](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/1_FRONT_END/html-css-js-10weeks/) | HTML5, CSS3, Flexbox/Grid, Responsive Web Design, JavaScript ES6+, API, React Hooks. |
| **2. Back-End** | [Node.js & Express API](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/2_BACK_END/nodejs-api-10weeks/) | Server Node.js, Express Router, Custom Middleware, RESTful API, MongoDB/Mongoose, JWT Auth. |
| | [Rust & Axum Web API](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/2_BACK_END/rust-backend-10weeks/) | Ownership, Borrowing & Lifetimes, Tokio Runtime, Axum HTTP Server, SQLx (PostgreSQL), JWT. |
| **3. Software Tools** | [Git, GitHub & Docker](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/3_SOFTWARE_DEV/git-docker-10weeks/) | Git commits, Branching, Merge Conflicts, GitHub Flow (PRs), Dockerfile, Docker Compose, CI/CD. |
| **4. Data Science** | [NumPy & Pandas Foundations](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/4_DATA_SCIENCE/data-science-10weeks/) | Môi trường Jupyter, Tính toán ma trận với NumPy, Làm sạch & Phân nhóm DataFrame bằng Pandas. |
| **5. Cybersecurity & AI** | [Cybersec & Next-Gen AI](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/5_ARTIFICIAL_INTELLIGENCE/cybersec-ai-10weeks/) | Lập trình socket Python/C++, Phân tích gói tin Scapy, AI Vulnerability Scanning, AI Log Auditing. |
| | [Practical Cybersecurity](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/5_ARTIFICIAL_INTELLIGENCE/cybersecurity-10weeks/) | Lab Setup (Kali), Bash Scripting, Nmap Scanning, Wireshark Sniffing, Hashcat Cracking, Metasploit, Snort. |
| **6. Web3 & Blockchain**| [Ethereum, Solidity & DApps](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/6_WEB3/blockchain-dapps-10weeks/) | EVM, Hợp đồng thông minh Solidity, Tiêu chuẩn Token ERC-20/NFTs, Remix IDE, Ethers.js, MetaMask. |
| | [Rust & Solana Programs](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/6_WEB3/rust-web3-10weeks/) | SVM (Solana Virtual Machine), Account Model, Anchor Framework, SPL Tokens, CPI calls, Unit tests. |

---

## 🎯 Đối Tượng Học Tập / Target Audience

Mỗi khoá học được xây dựng với phương pháp sư phạm dễ tiếp cận nhưng đi sâu vào bản chất kỹ thuật, phù học với:
1. **Học sinh & Sinh viên (KIDS / Teens / Students)**: Thích khám phá công nghệ, có tư duy logic cơ bản và muốn tự tay xây dựng các trang web, trò chơi hoặc bot thông minh.
2. **Người mới bắt đầu (Beginners)**: Những người chuyển ngành hoặc mong muốn có nền tảng vững chắc về lập trình phần mềm chuẩn công nghiệp.
3. **Lập trình viên muốn nâng cao kỹ năng (Aspiring Developers)**: Muốn làm chủ các công nghệ hiện đại và hiệu năng cao như **Rust**, **Docker**, hay lập trình **Smart Contracts (Solidity/Solana)**.
4. **Học viên đam mê bảo mật (Security Enthusiasts)**: Tiếp cận an ninh mạng từ góc độ lập trình viên, hiểu cơ chế tấn công và lập trình công cụ phòng thủ tích hợp AI.

---

## 🗂️ Sắp Xếp Thư Mục Không Gian Làm Việc / Workspace Architecture

Thư mục gốc của repository được tối ưu hoá và dọn dẹp cực kỳ gọn gàng:

```text
/Users/dangvietchung/Aero-Fullstack4kid/
├── courses/                     ← [Chính] Chứa 8 khoá học 10 tuần, tài liệu thô gốc & phụ lục
│   ├── 1_FRONT_END/             ← Chứa khoá học 10 tuần & thư mục tài liệu thô gốc Front-end
│   ├── ...                      
│   ├── 6_WEB3/                  ← Chứa các khoá học 10 tuần & thư mục tài liệu thô gốc Web3
│   └── APPENDIX_A/              ← Phụ lục tài liệu học tập (Swift, tips, etc.)
├── platform/                    ← Nền tảng ứng dụng Web hiển thị giáo trình tương tác (React / Vite)
│   ├── src/                     ← Mã nguồn giao diện (Roadmap, Lesson Viewer, AI Simulator, Code Center)
│   ├── public/                  ← Tài nguyên tĩnh của website
│   └── package.json             ← Các thư viện phụ thuộc
├── venv/                        ← Thư mục môi trường ảo Python cô lập
├── docs/                        ← Các tài liệu hướng dẫn và ghi chú rời
└── README.md                    ← [Tệp tin hiện tại] Tài liệu hướng dẫn chung
```

---

## 💻 Cách Khởi Chạy Nền Tảng Giao Diện Web / How to Run the Web Platform

Để xem giáo trình trực quan, sử dụng **Trình giả lập AI Trợ lý** và tra cứu **Kho code mẫu**, hãy chạy ứng dụng web cục bộ:

### 1. Cài đặt các thư viện phụ thuộc (Dependencies)
Mở terminal tại thư mục `platform/` và chạy lệnh:
```bash
cd platform
npm install
```

### 2. Khởi chạy máy chủ phát triển (Development Server)
Chạy lệnh sau để khởi chạy local server:
```bash
npm run dev
```
Sau đó truy cập địa chỉ hiển thị trên terminal (thông thường là `http://localhost:5173`) để sử dụng giao diện HUD của học viện.

---

## 🛡️ Nguyên Tắc An Toàn / Safety & Ethical Use
Toàn bộ mã nguồn và kiến thức liên quan đến an ninh mạng (Module 5) được thiết kế cho mục đích giảng dạy phòng thủ, kiểm thử an toàn (auditing) và lập trình an toàn. Nghiêm cấm sử dụng các công cụ được tạo ra để thực hiện các cuộc tấn công không được cấp phép vào hệ thống khác.
