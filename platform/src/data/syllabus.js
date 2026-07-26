// Export syllabus data for all courses in the academy
export const coursesData = {
  "1_FRONT_END": {
    id: "1_FRONT_END",
    title: "Front-End: HTML, CSS, JS & React",
    shortDesc: "Lập trình giao diện Web hiện đại sử dụng HTML5, CSS3, JavaScript ES6+ và thư viện React.js.",
    syllabus: [
      {
        id: "fe-m1",
        title: "Module 1: Thiết kế giao diện với HTML5 & CSS3",
        shortDesc: "Làm chủ cú pháp HTML5, các thẻ ngữ nghĩa và thuộc tính CSS3 căn bản.",
        lessons: [
          {
            id: "fe-w1",
            title: "Bài 1: Cú pháp HTML5 & CSS3 Cơ bản",
            duration: "2.5 giờ",
            objectives: [
              "Hiểu cấu trúc tài liệu HTML5 và các thẻ cơ bản (div, p, h1-h6).",
              "Sử dụng CSS Selector để căn chỉnh màu sắc, font chữ.",
              "Hiểu cơ chế Box Model (margin, padding, border)."
            ],
            content: "### 1. Cấu trúc tài liệu HTML5\nMột tài liệu HTML5 chuẩn luôn bắt đầu bằng `<!DOCTYPE html>` và chứa các thẻ cấu trúc cơ bản:\n```html\n<!DOCTYPE html>\n<html>\n<head>\n  <meta charset='utf-8'>\n  <title>Trang Web Đầu Tiên</title>\n</head>\n<body>\n  <h1>Xin chào!</h1>\n</body>\n</html>\n```\n### 2. CSS Box Model\nMọi phần tử trên trang web đều được xem như một chiếc hộp chữ nhật có 4 lớp: Content, Padding, Border, và Margin."
          },
          {
            id: "fe-w2",
            title: "Bài 2: Dàn trang với Flexbox & Grid",
            duration: "2.5 giờ",
            objectives: [
              "Sử dụng Flexbox để căn chỉnh giao diện theo một chiều.",
              "Sử dụng CSS Grid để thiết kế lưới giao diện 2 chiều phức tạp.",
              "Vận dụng properties như justify-content, align-items."
            ],
            content: "### 1. Flexbox Layout\nFlexbox giúp căn chỉnh các phần tử con dọc theo một trục chính (main axis) hoặc trục phụ (cross axis):\n```css\n.container {\n  display: flex;\n  justify-content: space-between;\n  align-items: center;\n}\n```"
          }
        ],
        labs: [
          {
            id: "fe-lab1",
            title: "Lab 1: Tạo Giao diện Portfolio Cá nhân",
            description: "Thực hành thiết kế một trang web giới thiệu bản thân hoàn chỉnh, chia thành các phần Header, About, Skills, Projects, và Contact sử dụng Flexbox và Grid.",
            steps: [
              "Bước 1: Viết mã HTML phân tách các phần bằng thẻ semantic (header, section, footer).",
              "Bước 2: Sử dụng CSS Flexbox để dàn trang Header menu nằm ngang.",
              "Bước 3: Sử dụng CSS Grid cho phần Project gallery hiển thị nhiều thẻ dự án song song."
            ]
          }
        ]
      }
    ]
  },
  "2_BACK_END": {
    id: "2_BACK_END",
    title: "Back-End: Node.js & Express API",
    shortDesc: "Xây dựng máy chủ ứng dụng web chuyên nghiệp sử dụng Node.js, Express.js, RESTful API và MongoDB.",
    syllabus: [
      {
        id: "be-m1",
        title: "Module 1: Máy chủ Node.js & Định tuyến Express",
        shortDesc: "Tìm hiểu kiến trúc bất đồng bộ của Node.js và xây dựng API router bằng Express.",
        lessons: [
          {
            id: "be-w1",
            title: "Bài 1: Tổng quan Node.js & Core Modules",
            duration: "2.5 giờ",
            objectives: [
              "Hiểu cơ chế hoạt động đơn luồng (Single Thread) và Event Loop của Node.js.",
              "Sử dụng module file system (fs) để đọc ghi file bất đồng bộ.",
              "Quản lý đường dẫn bằng module path."
            ],
            content: "### 1. Kiến trúc Node.js\nNode.js chạy trên V8 Engine của Google, sử dụng mô hình I/O phi chặn (non-blocking) giúp xử lý hàng ngàn request cùng lúc.\n### 2. File System (fs) code mẫu:\n```javascript\nconst fs = require('fs');\nfs.writeFile('log.txt', 'Log message', (err) => {\n  if (err) throw err;\n  console.log('File written');\n});\n```"
          },
          {
            id: "be-w2",
            title: "Bài 2: Express.js Router & Middleware",
            duration: "2.5 giờ",
            objectives: [
              "Khởi tạo Express app và viết các api endpoint GET, POST.",
              "Sử dụng Express Router để chia nhỏ hệ thống định tuyến.",
              "Viết custom middleware để log request."
            ],
            content: "### 1. Express Router\nRouter giúp gộp nhóm các endpoint có cùng tiền tố:\n```javascript\nconst express = require('express');\nconst router = express.Router();\nrouter.get('/users', (req, res) => res.json([]));\n```"
          }
        ],
        labs: [
          {
            id: "be-lab1",
            title: "Lab 1: Xây dựng RESTful API CRUD cho Danh mục Sản phẩm",
            description: "Học viên sẽ lập trình một API server bằng Express cho phép thêm, sửa, xóa, đọc thông tin sản phẩm và kiểm thử bằng Postman.",
            steps: [
              "Bước 1: Khởi tạo project node với `npm init -y` và cài đặt express.",
              "Bước 2: Viết router CRUD với các method GET, POST, PUT, DELETE.",
              "Bước 3: Tích hợp middleware body-parser để parse dữ liệu JSON từ client gửi lên."
            ]
          }
        ]
      }
    ]
  },
  "2_BACK_END_RUST": {
    id: "2_BACK_END_RUST",
    title: "Back-End: Rust & Axum Web API",
    shortDesc: "Lập trình hệ thống máy chủ hiệu năng cao, kiểm soát bộ nhớ an toàn (Ownership/Borrowing) và web APIs tốc độ cao với Axum/Tokio.",
    syllabus: [
      {
        id: "rust-be-m1",
        title: "Module 1: Ngôn ngữ Rust & Lập trình mạng bất đồng bộ",
        shortDesc: "Tìm hiểu cú pháp cốt lõi của Rust, cơ chế quản lý bộ nhớ an toàn và runtime Tokio.",
        lessons: [
          {
            id: "rbe-w1",
            title: "Bài 1: Làm chủ Ownership & Borrowing",
            duration: "2.5 giờ",
            objectives: [
              "Hiểu quy tắc sở hữu bộ nhớ (Ownership rules) và cơ chế dọn dẹp biến.",
              "Phân biệt tham chiếu bất biến (immutable borrow) và tham chiếu khả biến (mutable borrow).",
              "Sử dụng clippy để sửa các lỗi biên dịch thông thường."
            ],
            content: "### 1. Quy tắc Ownership trong Rust\n- Mỗi giá trị trong Rust chỉ có một biến sở hữu (owner) tại một thời điểm.\n- Khi owner đi ra ngoài phạm vi (out of scope), giá trị sẽ tự động bị hủy (drop).\n- Việc gán giá trị String từ biến này sang biến khác sẽ chuyển quyền sở hữu (move semantics).\n### 2. Vay mượn (Borrowing)\nThay vì chuyển quyền sở hữu, ta có thể cho hàm mượn thông qua tham chiếu `&`:\n```rust\nfn calculate_length(s: &String) -> usize { s.len() }\n```"
          },
          {
            id: "rbe-w2",
            title: "Bài 2: Máy chủ HTTP Axum & Serde JSON",
            duration: "2.5 giờ",
            objectives: [
              "Khởi tạo server HTTP bằng thư viện Axum bất đồng bộ.",
              "Sử dụng Serde để tự động parse (deserialize) dữ liệu JSON đầu vào.",
              "Tạo các endpoint RESTful trả về mã trạng thái HTTP thích hợp."
            ],
            content: "### 1. Khởi tạo Axum Server\n```rust\nuse axum::{routing::get, Router};\n#[tokio::main]\nasync fn main() {\n    let app = Router::new().route(\"/\", get(|| async { \"Hello Axum\" }));\n    let listener = tokio::net::TcpListener::bind(\"127.0.0.1:3000\").await.unwrap();\n    axum::serve(listener, app).await.unwrap();\n}\n```"
          }
        ],
        labs: [
          {
            id: "rbe-lab1",
            title: "Lab 1: Xây dựng RESTful API CRUD quản lý người dùng với CSDL PostgreSQL",
            description: "Thực hành thiết lập cơ sở dữ liệu Postgres, sử dụng SQLx kết nối và viết API thêm/sửa/xóa thông tin người dùng bằng Axum.",
            steps: [
              "Bước 1: Cài đặt SQLx CLI và khởi chạy PostgreSQL cục bộ.",
              "Bước 2: Viết mã nguồn Rust kết nối database pool thông qua biến môi trường.",
              "Bước 3: Viết các struct đầu vào/đầu ra và mapping với truy vấn SQLx."
            ]
          }
        ]
      }
    ]
  },
  "3_SOFTWARE_DEV": {
    id: "3_SOFTWARE_DEV",
    title: "Software Tools: Git, GitHub & Docker",
    shortDesc: "Làm chủ quy trình quản lý phiên bản mã nguồn với Git và đóng gói triển khai ứng dụng với Docker.",
    syllabus: [
      {
        id: "dev-m1",
        title: "Module 1: Git & GitHub trong Môi trường Chuyên nghiệp",
        shortDesc: "Làm chủ quy trình commit, branch, merge conflict và cộng tác nhóm qua Pull Requests.",
        lessons: [
          {
            id: "dev-w1",
            title: "Bài 1: Git Core: Commit & Khởi tạo dự án",
            duration: "2.5 giờ",
            objectives: [
              "Hiểu 3 phân vùng của Git (Working Directory, Staging Area, Local Repository).",
              "Sử dụng các lệnh git init, add, commit, status, log.",
              "Cấu hình tệp tin .gitignore chính xác."
            ],
            content: "### 1. Quy trình làm việc với Git\nGit quản lý các phiên bản bằng cách chụp ảnh nhanh (snapshots) trạng thái thư mục:\n```bash\ngit init\ngit add .\ngit commit -m 'feat: initial project structure'\n```"
          },
          {
            id: "dev-w2",
            title: "Bài 2: Nhánh & Hợp nhất nhánh trong Git",
            duration: "2.5 giờ",
            objectives: [
              "Tạo và chuyển đổi nhánh bằng git branch, git checkout.",
              "Thực hiện gộp nhánh (merge) và giải quyết xung đột mã nguồn (Conflicts).",
              "Hiểu về Git Flow tiêu chuẩn."
            ],
            content: "### 1. Merge Conflicts\nXảy ra khi hai nhánh cùng sửa đổi một dòng code trong cùng một file. Bạn phải mở file trên VS Code và lựa chọn phiên bản giữ lại:\n```text\n<<<<<<< HEAD\ncode trên nhánh hiện tại\n=======\ncode trên nhánh trộn vào\n>>>>>>> feature\n```"
          }
        ],
        labs: [
          {
            id: "dev-lab1",
            title: "Lab 1: Giả lập quy trình giải quyết xung đột Merge Conflict",
            description: "Thực hiện tạo hai nhánh tính năng cùng sửa đổi một dòng trong file README.md, tiến hành merge để kích hoạt xung đột và sửa lỗi thủ công trên VS Code.",
            steps: [
              "Bước 1: Tạo repo local và tạo nhánh `main` chứa file text.",
              "Bước 2: Tạo nhánh `feature-a` và `feature-b`, sửa cùng một dòng trong file text đó và commit.",
              "Bước 3: Chuyển về main, merge feature-a (thành công), merge feature-b (xung đột). Tiến hành giải quyết."
            ]
          }
        ]
      }
    ]
  },
  "4_MOBILE_DEV": {
    id: "4_MOBILE_DEV",
    title: "Data Science: NumPy & Pandas",
    shortDesc: "Học phân tích dữ liệu, xử lý ma trận số học với NumPy và làm sạch bảng dữ liệu với thư viện Pandas.",
    syllabus: [
      {
        id: "ds-m1",
        title: "Module 1: Phân tích Dữ liệu số với NumPy",
        shortDesc: "Tìm hiểu cấu trúc mảng nhiều chiều và các phép toán vector hóa hiệu năng cao.",
        lessons: [
          {
            id: "ds-w1",
            title: "Bài 1: Mảng NumPy Cơ bản",
            duration: "2.5 giờ",
            objectives: [
              "Hiểu tại sao NumPy ndarray chạy nhanh hơn List của Python.",
              "Tạo mảng 1D, 2D và kiểm tra các thuộc tính shape, dtype.",
              "Thực hiện các phép toán vector hóa cơ bản."
            ],
            content: "### 1. Tại sao dùng NumPy?\nNumPy ndarray lưu trữ dữ liệu liên tục trong bộ nhớ và thực hiện các phép toán C cấp thấp, tránh được overhead của vòng lặp Python:\n```python\nimport numpy as np\narr = np.array([[1,2,3], [4,5,6]])\nprint(arr.ndim) # 2\n```"
          },
          {
            id: "ds-w2",
            title: "Bài 2: Phép toán số học Vector & Slicing",
            duration: "2.5 giờ",
            objectives: [
              "Sử dụng slicing trích xuất mảng con.",
              "Hiểu quy tắc lan truyền (Broadcasting) khi cộng mảng khác kích thước.",
              "Tính toán tích ma trận bằng np.dot."
            ],
            content: "### 1. Matrix Multiplication\nThực hiện nhân hai ma trận số học:\n```python\na = np.random.rand(2, 3)\nb = np.random.rand(3, 4)\nc = np.dot(a, b) # Matrix product shape: (2, 4)\n```"
          }
        ],
        labs: [
          {
            id: "ds-lab1",
            title: "Lab 1: Chuẩn hóa dữ liệu điểm số học sinh sử dụng NumPy",
            description: "Thực hiện đọc danh sách điểm số dạng mảng, tính toán điểm trung bình, độ lệch chuẩn, lọc ra danh sách học sinh đạt điểm giỏi bằng Boolean Indexing.",
            steps: [
              "Bước 1: Khởi tạo mảng NumPy 2D chứa điểm số các môn học của 10 học sinh.",
              "Bước 2: Tính điểm trung bình môn của từng học sinh (trục axis=1).",
              "Bước 3: Lọc ra các học sinh có điểm trung bình lớn hơn 8.0 sử dụng Boolean Indexing."
            ]
          }
        ]
      }
    ]
  },
  "5_ARTIFICIAL_INTELLIGENCE": {
    id: "5_ARTIFICIAL_INTELLIGENCE",
    title: "AI & Cybersecurity: Tools & Sniffers",
    shortDesc: "Lập trình Python/C++ hệ thống, phân tích gói tin mạng và ứng dụng mô hình AI (Ollama/Gemini) tự động hóa an ninh thông tin.",
    syllabus: [
      {
        id: "sec-m1",
        title: "Module 1: Lập trình Python & C++ cho An ninh mạng",
        shortDesc: "Lập trình socket mạng bằng Python và kiểm soát bộ nhớ Stack/Heap bằng C++.",
        lessons: [
          {
            id: "sec-w1",
            title: "Bài 1: Giới thiệu Python cho Security & Sockets",
            duration: "2.5 giờ",
            objectives: [
              "Hiểu vai trò của Python trong scripting an ninh mạng.",
              "Viết chương trình Client-Server socket đơn giản.",
              "Thiết lập cơ chế timeout cho socket."
            ],
            content: "### 1. Socket Programming in Python\nThư viện socket tích hợp giúp thiết lập kết nối mạng nhanh chóng:\n```python\nimport socket\ns = socket.socket(socket.AF_INET, socket.SOCK_STREAM)\ns.connect(('127.0.0.1', 80))\n```"
          },
          {
            id: "sec-w2",
            title: "Bài 2: Phân tích & Gửi gói tin nâng cao với Scapy",
            duration: "2.5 giờ",
            objectives: [
              "Chặn bắt gói tin mạng bằng Scapy sniff.",
              "Tự thiết kế gói tin IP/TCP tùy chỉnh.",
              "Thực hiện quét mạng ARP Scan cơ bản."
            ],
            content: "### 1. Packet sniffing with Scapy\n```python\nfrom scapy.all import sniff\npackets = sniff(count=5)\npackets.show()\n```"
          }
        ],
        labs: [
          {
            id: "sec-lab1",
            title: "Lab 1: Phát triển TCP Port Scanner đa luồng",
            description: "Lập trình một công cụ quét cổng TCP song song sử dụng thread trong Python và C++, so sánh tốc độ thực thi giữa hai phiên bản trên cổng localhost.",
            steps: [
              "Bước 1: Viết bản Python sử dụng queue và module threading để quét 1024 cổng đầu tiên.",
              "Bước 2: Viết bản C++ tương ứng sử dụng std::thread và kiểm soát kết nối Socket.",
              "Bước 3: Đo đạc và lập biểu đồ so sánh tốc độ quét của hai công cụ."
            ]
          }
        ]
      }
    ]
  },
  "5_CYBERSECURITY": {
    id: "5_CYBERSECURITY",
    title: "Cybersecurity & Practical Pentesting",
    shortDesc: "Đào tạo kỹ năng thực chiến an ninh mạng, kiểm thử xâm nhập thực tế và sử dụng các công cụ Kali Linux (Nmap, Wireshark, Hashcat, Metasploit).",
    syllabus: [
      {
        id: "cy-m1",
        title: "Module 1: Dò quét mạng & Phân tích an ninh hệ thống",
        shortDesc: "Học cách thiết lập môi trường Lab ảo và thực hiện dò quét cổng, phân tích lưu lượng mạng.",
        lessons: [
          {
            id: "cy-w1",
            title: "Bài 1: Thiết lập Lab ảo & Linux cơ bản",
            duration: "2.5 giờ",
            objectives: [
              "Cài đặt phần mềm ảo hóa VirtualBox và hệ điều hành Kali Linux.",
              "Thành thạo các lệnh quản trị Linux CLI căn bản.",
              "Viết và chạy thành công script Bash đơn giản đầu tiên."
            ],
            content: "### 1. Mô hình phòng Lab bảo mật\nPhòng lab bao gồm máy tấn công (Kali Linux) và máy mục tiêu (Windows/Linux Server lỗi) kết nối thông qua mạng Host-only cô lập.\n### 2. Các lệnh Linux cơ bản\n- \`ip a\`: Kiểm tra card mạng.\n- \`chmod +x script.sh\`: Cấp quyền chạy file script."
          },
          {
            id: "cy-w2",
            title: "Bài 2: Dò quét mạng Nmap & Phân tích Wireshark",
            duration: "2.5 giờ",
            objectives: [
              "Sử dụng các kỹ thuật quét SYN Scan, UDP Scan của Nmap để phát hiện cổng mở.",
              "Cấu hình Wireshark chặn bắt và giải mã dữ liệu mạng.",
              "Sử dụng bộ lọc (filters) Wireshark để trích xuất thông tin đăng nhập thô."
            ],
            content: "### 1. Quét SYN Scan với Nmap\nSYN Scan (Half-open scan) không hoàn thành bắt tay 3 bước, giúp tăng tốc độ quét và hạn chế ghi log:\n```bash\nnmap -sS -sV 192.168.56.101\n```\n### 2. Bắt gói tin Wireshark\nChặn bắt lưu lượng mạng và phân tích chuỗi TCP Stream để tìm mật khẩu truyền không mã hóa."
          }
        ],
        labs: [
          {
            id: "cy-lab1",
            title: "Lab 1: Thực hiện Audit An ninh mạng nội bộ sử dụng Nmap và Wireshark",
            description: "Thực hiện quét phát hiện các lỗi bảo mật dịch vụ chạy trên máy ảo local và phân tích gói tin để bắt thông tin đăng nhập HTTP.",
            steps: [
              "Bước 1: Khởi động máy ảo Kali Linux và mục tiêu, kiểm tra kết nối ping.",
              "Bước 2: Chạy Nmap quét toàn bộ cổng mở và phát hiện hệ điều hành.",
              "Bước 3: Mở Wireshark bắt gói tin, đăng nhập thử vào trang web DVWA cục bộ và tìm mật khẩu."
            ]
          }
        ]
      }
    ]
  },
  "6_WEB3": {
    id: "6_WEB3",
    title: "Web3: Ethereum, Solidity & DApps",
    shortDesc: "Học lập trình hợp đồng thông minh Solidity trên Ethereum, tiêu chuẩn Token ERC-20/721 và kết nối DApp Frontend.",
    syllabus: [
      {
        id: "web3-m1",
        title: "Module 1: Lập trình Hợp đồng Thông minh Solidity",
        shortDesc: "Làm chủ ngôn ngữ Solidity, cấu trúc EVM, các kiểu dữ liệu và triển khai contract trên Remix.",
        lessons: [
          {
            id: "web3-w1",
            title: "Bài 1: Nguyên lý Blockchain & Cấu trúc EVM",
            duration: "2.5 giờ",
            objectives: [
              "Hiểu mạng ngang hàng (P2P), cơ chế đồng thuận Proof of Work / Proof of Stake.",
              "Cấu hình ví MetaMask kết nối mạng thử nghiệm Sepolia Testnet.",
              "Hiểu kiến trúc máy ảo Ethereum Virtual Machine (EVM)."
            ],
            content: "### 1. Kiến trúc khối Blockchain\nMỗi khối (block) chứa dữ liệu giao dịch, chỉ số nonce, hash của khối trước và hash của khối hiện tại.\n### 2. MetaMask Wallet\nVí MetaMask giúp người dùng lưu trữ khóa bí mật (Private Key) và ký các giao dịch chuyển tiền trực tiếp trên trình duyệt Web."
          },
          {
            id: "web3-w2",
            title: "Bài 2: Solidity & Remix IDE",
            duration: "2.5 giờ",
            objectives: [
              "Sử dụng môi trường Remix IDE để viết và compile contract.",
              "Hiểu cấu trúc một file contract Solidity và các phiên bản compiler.",
              "Thực hiện deploy contract giả lập trên JavaScript VM."
            ],
            content: "### 1. Hợp đồng thông minh Solidity đầu tiên\n```solidity\n// SPDX-License-Identifier: MIT\npragma solidity ^0.8.0;\n\ncontract Storage {\n    uint256 number;\n    function store(uint256 num) public {\n        number = num;\n    }\n    function retrieve() public view returns (uint256){\n        return number;\n    }\n}\n```"
          }
        ],
        labs: [
          {
            id: "web3-lab1",
            title: "Lab 1: Viết và Triển khai Contract Ngân hàng phi tập trung",
            description: "Lập trình một contract Solidity cho phép nạp tiền (deposit), rút tiền (withdraw) kèm theo cơ chế lưu trữ số dư của từng tài khoản sử dụng mapping.",
            steps: [
              "Bước 1: Tạo file Bank.sol trong Remix IDE và khai báo mapping từ address sang uint.",
              "Bước 2: Viết hàm deposit nhận tiền gửi (payable) và cập nhật số dư.",
              "Bước 3: Viết hàm withdraw kiểm tra điều kiện ví người gửi có đủ tiền (require) trước khi chuyển."
            ]
          }
        ]
      }
    ]
  },
  "6_WEB3_RUST": {
    id: "6_WEB3_RUST",
    title: "Web3: Rust & Solana Smart Contracts",
    shortDesc: "Lập trình hợp đồng thông minh hiệu năng cao cho hệ sinh thái Solana sử dụng Anchor Framework bằng ngôn ngữ Rust.",
    syllabus: [
      {
        id: "rust-web3-m1",
        title: "Module 1: Kiến trúc Solana SVM & Lập trình Anchor",
        shortDesc: "Làm chủ mô hình tài khoản Solana Account Model và cấu trúc Anchor Program.",
        lessons: [
          {
            id: "rw3-w1",
            title: "Bài 1: Solana Account Model & CLI",
            duration: "2.5 giờ",
            objectives: [
              "Hiểu sự khác biệt về lưu trữ trạng thái giữa EVM (World State) và SVM (Account Model).",
              "Sử dụng Solana CLI để truy vấn số dư, xem dữ liệu tài khoản và airdrop SOL.",
              "Hiểu khái niệm Rent và Rent-exempt đối với tài khoản Solana."
            ],
            content: "### 1. Solana Account Model\n- Trong Solana, mã thực thi (Smart Contract) và dữ liệu (State) được tách biệt hoàn toàn.\n- Executable Account chỉ chứa bytecode của chương trình.\n- Data Account chứa trạng thái biến dữ liệu và được sở hữu bởi chương trình đó.\n### 2. Rent-exempt\nTài khoản dữ liệu phải duy trì một lượng SOL tối thiểu để được miễn phí duy trì lưu trữ trên validator."
          },
          {
            id: "rw3-w2",
            title: "Bài 2: Hợp đồng thông minh với Anchor Framework",
            duration: "2.5 giờ",
            objectives: [
              "Viết chương trình Anchor hoàn chỉnh sử dụng các macro #[program] và #[account].",
              "Thiết lập struct Account đầu vào để tự động kiểm tra chữ ký và phân quyền.",
              "Chạy Solana Local Validator cục bộ để deploy và debug chương trình."
            ],
            content: "### 1. Viết Anchor Program đơn giản\n```rust\nuse anchor_lang::prelude::*;\ndeclare_id!(\"Fg6PaFpoGXkYsidMpWTK6W2BeZ7FEfcYkg476zPFsLnS\");\n#[program]\npub mod hello_world {\n    use super::*;\n    pub fn initialize(ctx: Context<Initialize>) -> Result<()> {\n        msg!(\"Hello World from Anchor Program!\");\n        Ok(())\n    }\n}\n#[derive(Accounts)]\npub struct Initialize<'info> {}\n```"
          }
        ],
        labs: [
          {
            id: "rw3-lab1",
            title: "Lab 1: Phát triển chương trình Token Minting và chuyển token (SPL Token)",
            description: "Thực hành viết chương trình Solana Anchor để thực hiện đúc (mint) token mới và lập trình hàm chuyển (transfer) SPL Token an toàn.",
            steps: [
              "Bước 1: Khai báo phụ thuộc spl-token trong tệp Cargo.toml.",
              "Bước 2: Viết struct Context nhận các tài khoản Mint, Token Account và Authority.",
              "Bước 3: Viết logic gọi chéo (CPI - Cross Program Invocation) sang Token Program để mint token."
            ]
          }
        ]
      }
    ]
  }
};
