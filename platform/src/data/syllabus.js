// Export syllabus data for all courses in the academy
export const coursesData = {
  "1_AI_DATA_SCIENCE": {
    "id": "1_AI_DATA_SCIENCE",
    "title": "AI & Data Science",
    "shortDesc": "Phân tích dữ liệu, Học máy và Trí tuệ Nhân tạo",
    "syllabus": [
      {
        "id": "ds-m1",
        "title": "[Data Science: NumPy & Pandas] Module 1: Phân tích Dữ liệu số với NumPy",
        "shortDesc": "Tìm hiểu cấu trúc mảng nhiều chiều và các phép toán vector hóa hiệu năng cao.",
        "lessons": [
          {
            "id": "ds-w1",
            "title": "Bài 1: Mảng NumPy Cơ bản",
            "duration": "2.5 giờ",
            "objectives": [
              "Hiểu tại sao NumPy ndarray chạy nhanh hơn List của Python.",
              "Tạo mảng 1D, 2D và kiểm tra các thuộc tính shape, dtype.",
              "Thực hiện các phép toán vector hóa cơ bản."
            ],
            "content": "### 1. Tại sao dùng NumPy?\nNumPy ndarray lưu trữ dữ liệu liên tục trong bộ nhớ và thực hiện các phép toán C cấp thấp, tránh được overhead của vòng lặp Python:\n```python\nimport numpy as np\narr = np.array([[1,2,3], [4,5,6]])\nprint(arr.ndim) # 2\n```"
          },
          {
            "id": "ds-w2",
            "title": "Bài 2: Phép toán số học Vector & Slicing",
            "duration": "2.5 giờ",
            "objectives": [
              "Sử dụng slicing trích xuất mảng con.",
              "Hiểu quy tắc lan truyền (Broadcasting) khi cộng mảng khác kích thước.",
              "Tính toán tích ma trận bằng np.dot."
            ],
            "content": "### 1. Matrix Multiplication\nThực hiện nhân hai ma trận số học:\n```python\na = np.random.rand(2, 3)\nb = np.random.rand(3, 4)\nc = np.dot(a, b) # Matrix product shape: (2, 4)\n```"
          }
        ],
        "labs": [
          {
            "id": "ds-lab1",
            "title": "Lab 1: Chuẩn hóa dữ liệu điểm số học sinh sử dụng NumPy",
            "description": "Thực hiện đọc danh sách điểm số dạng mảng, tính toán điểm trung bình, độ lệch chuẩn, lọc ra danh sách học sinh đạt điểm giỏi bằng Boolean Indexing.",
            "steps": [
              "Bước 1: Khởi tạo mảng NumPy 2D chứa điểm số các môn học của 10 học sinh.",
              "Bước 2: Tính điểm trung bình môn của từng học sinh (trục axis=1).",
              "Bước 3: Lọc ra các học sinh có điểm trung bình lớn hơn 8.0 sử dụng Boolean Indexing."
            ]
          }
        ]
      },
      {
        "id": "cv-m1",
        "title": "[Computer Vision] Module 1: Xử lý hình ảnh và Nhận diện Vật thể",
        "shortDesc": "Cung cấp cho máy tính 'đôi mắt' bằng OpenCV và Deep Learning để phân tích video, nhận diện khuôn mặt và vật thể.",
        "lessons": [
          {
            "id": "cv-w1",
            "title": "Bài 1: Xử lý ảnh cơ bản với OpenCV",
            "duration": "2.5 giờ",
            "objectives": [
              "Đọc, hiển thị và lưu trữ hình ảnh.",
              "Thao tác trên ma trận điểm ảnh, chuyển đổi hệ màu."
            ],
            "content": "### 1. Computer Vision là gì?\nThị giác máy tính (CV) là một lĩnh vực của AI giúp máy tính có thể hiểu được nội dung của hình ảnh và video.\n### 2. OpenCV\nThư viện hàng đầu về xử lý ảnh: `cv2.imread()`, `cv2.imshow()`."
          },
          {
            "id": "cv-w2",
            "title": "Bài 2: Nhận diện vật thể bằng YOLO",
            "duration": "2.5 giờ",
            "objectives": [
              "Hiểu kiến trúc mạng CNN trong xử lý ảnh.",
              "Sử dụng mô hình YOLO để đóng khung vật thể (Bounding Boxes)."
            ],
            "content": "### 1. YOLO (You Only Look Once)\nMô hình nhận diện vật thể thời gian thực cực kỳ nhanh và chính xác."
          }
        ],
        "labs": [
          {
            "id": "cv-lab1",
            "title": "Lab 1: Hệ thống Camera an ninh AI",
            "description": "Tích hợp OpenCV để đọc luồng video từ Webcam và dùng Haar Cascades để phát hiện người lạ đột nhập.",
            "steps": [
              "Bước 1: Mở webcam bằng cv2.VideoCapture(0).",
              "Bước 2: Tải mô hình haarcascade_frontalface_default.xml.",
              "Bước 3: Vẽ khung màu đỏ quanh khuôn mặt phát hiện được và hiển thị cảnh báo."
            ]
          }
        ]
      },
      {
        "id": "ai-m1",
        "title": "[Machine Learning & Deep Learning] Module 1: Xây dựng các mô hình phân tích và dự đoán",
        "shortDesc": "Khám phá nguyên lý hoạt động của các hệ thống AI phân tích dữ liệu lớn.",
        "lessons": [
          {
            "id": "ai-w1",
            "title": "Bài 1: Tổng quan Học máy & Scikit-Learn",
            "duration": "2.5 giờ",
            "objectives": [
              "Hiểu sự khác biệt giữa AI, Machine Learning và Deep Learning.",
              "Sử dụng thư viện Scikit-Learn huấn luyện mô hình dự đoán cơ bản.",
              "Hiểu các bước xử lý dữ liệu (data preprocessing)."
            ],
            "content": "### 1. Phân biệt AI, ML, và DL\n- **Trí tuệ nhân tạo (AI)**: Lĩnh vực rộng lớn mô phỏng trí thông minh con người.\n- **Học máy (ML)**: Tập hợp các thuật toán học từ dữ liệu mà không cần lập trình tường minh.\n- **Học sâu (DL)**: Phân ngành của ML sử dụng mạng nơ-ron sâu (Deep Neural Networks).\n### 2. Ví dụ huấn luyện mô hình Scikit-Learn\n```python\nfrom sklearn.linear_model import LinearRegression\nmodel = LinearRegression()\nmodel.fit(X_train, y_train)\n```"
          }
        ],
        "labs": [
          {
            "id": "ai-lab1",
            "title": "Lab 1: Xây dựng bộ dự đoán phân loại Bệnh tim mạch",
            "description": "Thực hành quy trình chuẩn bị dữ liệu, chia tập Train/Test, huấn luyện và đánh giá mô hình phân loại sử dụng thư viện Scikit-Learn.",
            "steps": [
              "Bước 1: Load tập dữ liệu thông số sức khỏe tim mạch bằng Pandas.",
              "Bước 2: Sử dụng train_test_split phân chia tập huấn luyện và tập kiểm thử.",
              "Bước 3: Huấn luyện bộ phân loại Logistic Regression và đánh giá độ chính xác (Accuracy)."
            ]
          }
        ]
      }
    ]
  },
  "2_SOFTWARE_ENGINEERING": {
    "id": "2_SOFTWARE_ENGINEERING",
    "title": "Software Engineering",
    "shortDesc": "Thiết kế, xây dựng và triển khai các ứng dụng phần mềm đa nền tảng.",
    "syllabus": [
      {
        "id": "cs-m1",
        "title": "[CS Fundamentals: Lập trình trực quan Scratch] Module 1: Tư duy Máy tính với Scratch",
        "shortDesc": "Tìm hiểu vòng lặp, điều kiện, biến số và làm các dự án game mini như Flappy Bird, Space Shooter.",
        "lessons": [
          {
            "id": "cs-w1",
            "title": "Bài 1: Giao diện Scratch & Tọa độ",
            "duration": "2.0 giờ",
            "objectives": [
              "Làm quen Stage, Sprite và khối Motion.",
              "Hiểu trục toạ độ X ngang, Y dọc.",
              "Ghép khối lệnh để nhân vật di chuyển."
            ],
            "content": "### 1. Khối lệnh (Blocks)\nCác khối lệnh trong Scratch được thiết kế giống trò xếp hình Lego. Chỉ các khối có viền khớp nhau mới ghép được, giúp hạn chế tối đa lỗi cú pháp (Syntax Error).\n### 2. Sự kiện (Events)\nMọi chương trình Scratch thường bắt đầu bằng khối lệnh 'When Green Flag Clicked'."
          },
          {
            "id": "cs-w2",
            "title": "Bài 2: Vòng Lặp & Câu Lệnh Điều Kiện",
            "duration": "2.0 giờ",
            "objectives": [
              "Sử dụng vòng lặp Forever và Repeat.",
              "Sử dụng khối If-Else để kiểm tra điều kiện.",
              "Sử dụng Sensing (Cảm biến) để phát hiện va chạm."
            ],
            "content": "### 1. Vòng lặp liên tục\nTrong lập trình game, chúng ta luôn cần một vòng lặp chạy liên tục (Game Loop) để lắng nghe sự kiện từ người chơi và cập nhật đồ hoạ mỗi khung hình.\n### 2. Kiểm tra va chạm (Collision)\nDùng khối lệnh 'if <touching [color/sprite]>' để tính điểm hoặc kết thúc game khi hai nhân vật chạm nhau."
          }
        ],
        "labs": [
          {
            "id": "cs-lab1",
            "title": "Lab 1: Game Hứng Táo (Catch the Apples)",
            "description": "Thực hành thiết kế một chiếc giỏ di chuyển bằng phím mũi tên trái/phải để hứng các quả táo rơi ngẫu nhiên từ trên trời xuống.",
            "steps": [
              "Bước 1: Vẽ hoặc chọn Sprite Giỏ và Quả táo.",
              "Bước 2: Viết code cho Giỏ di chuyển theo phím mũi tên bằng khối 'change x by...'.",
              "Bước 3: Viết code cho Táo tự rơi xuống ('change y by...'). Nếu chạm Giỏ thì phát âm thanh và tăng biến Điểm."
            ]
          }
        ]
      },
      {
        "id": "fe-m1",
        "title": "[Front-End: HTML, CSS, JS & React] Module 1: Thiết kế giao diện với HTML5 & CSS3",
        "shortDesc": "Làm chủ cú pháp HTML5, các thẻ ngữ nghĩa và thuộc tính CSS3 căn bản.",
        "lessons": [
          {
            "id": "fe-w1",
            "title": "Bài 1: Cú pháp HTML5 & CSS3 Cơ bản",
            "duration": "2.5 giờ",
            "objectives": [
              "Hiểu cấu trúc tài liệu HTML5 và các thẻ cơ bản (div, p, h1-h6).",
              "Sử dụng CSS Selector để căn chỉnh màu sắc, font chữ.",
              "Hiểu cơ chế Box Model (margin, padding, border)."
            ],
            "content": "### 1. Cấu trúc tài liệu HTML5\nMột tài liệu HTML5 chuẩn luôn bắt đầu bằng `<!DOCTYPE html>` và chứa các thẻ cấu trúc cơ bản:\n```html\n<!DOCTYPE html>\n<html>\n<head>\n  <meta charset='utf-8'>\n  <title>Trang Web Đầu Tiên</title>\n</head>\n<body>\n  <h1>Xin chào!</h1>\n</body>\n</html>\n```\n### 2. CSS Box Model\nMọi phần tử trên trang web đều được xem như một chiếc hộp chữ nhật có 4 lớp: Content, Padding, Border, và Margin."
          },
          {
            "id": "fe-w2",
            "title": "Bài 2: Dàn trang với Flexbox & Grid",
            "duration": "2.5 giờ",
            "objectives": [
              "Sử dụng Flexbox để căn chỉnh giao diện theo một chiều.",
              "Sử dụng CSS Grid để thiết kế lưới giao diện 2 chiều phức tạp.",
              "Vận dụng properties như justify-content, align-items."
            ],
            "content": "### 1. Flexbox Layout\nFlexbox giúp căn chỉnh các phần tử con dọc theo một trục chính (main axis) hoặc trục phụ (cross axis):\n```css\n.container {\n  display: flex;\n  justify-content: space-between;\n  align-items: center;\n}\n```"
          }
        ],
        "labs": [
          {
            "id": "fe-lab1",
            "title": "Lab 1: Tạo Giao diện Portfolio Cá nhân",
            "description": "Thực hành thiết kế một trang web giới thiệu bản thân hoàn chỉnh, chia thành các phần Header, About, Skills, Projects, và Contact sử dụng Flexbox và Grid.",
            "steps": [
              "Bước 1: Viết mã HTML phân tách các phần bằng thẻ semantic (header, section, footer).",
              "Bước 2: Sử dụng CSS Flexbox để dàn trang Header menu nằm ngang.",
              "Bước 3: Sử dụng CSS Grid cho phần Project gallery hiển thị nhiều thẻ dự án song song."
            ]
          }
        ]
      },
      {
        "id": "be-m1",
        "title": "[Back-End: Node.js & Express API] Module 1: Máy chủ Node.js & Định tuyến Express",
        "shortDesc": "Tìm hiểu kiến trúc bất đồng bộ của Node.js và xây dựng API router bằng Express.",
        "lessons": [
          {
            "id": "be-w1",
            "title": "Bài 1: Tổng quan Node.js & Core Modules",
            "duration": "2.5 giờ",
            "objectives": [
              "Hiểu cơ chế hoạt động đơn luồng (Single Thread) và Event Loop của Node.js.",
              "Sử dụng module file system (fs) để đọc ghi file bất đồng bộ.",
              "Quản lý đường dẫn bằng module path."
            ],
            "content": "### 1. Kiến trúc Node.js\nNode.js chạy trên V8 Engine của Google, sử dụng mô hình I/O phi chặn (non-blocking) giúp xử lý hàng ngàn request cùng lúc.\n### 2. File System (fs) code mẫu:\n```javascript\nconst fs = require('fs');\nfs.writeFile('log.txt', 'Log message', (err) => {\n  if (err) throw err;\n  console.log('File written');\n});\n```"
          },
          {
            "id": "be-w2",
            "title": "Bài 2: Express.js Router & Middleware",
            "duration": "2.5 giờ",
            "objectives": [
              "Khởi tạo Express app và viết các api endpoint GET, POST.",
              "Sử dụng Express Router để chia nhỏ hệ thống định tuyến.",
              "Viết custom middleware để log request."
            ],
            "content": "### 1. Express Router\nRouter giúp gộp nhóm các endpoint có cùng tiền tố:\n```javascript\nconst express = require('express');\nconst router = express.Router();\nrouter.get('/users', (req, res) => res.json([]));\n```"
          }
        ],
        "labs": [
          {
            "id": "be-lab1",
            "title": "Lab 1: Xây dựng RESTful API CRUD cho Danh mục Sản phẩm",
            "description": "Học viên sẽ lập trình một API server bằng Express cho phép thêm, sửa, xóa, đọc thông tin sản phẩm và kiểm thử bằng Postman.",
            "steps": [
              "Bước 1: Khởi tạo project node với `npm init -y` và cài đặt express.",
              "Bước 2: Viết router CRUD với các method GET, POST, PUT, DELETE.",
              "Bước 3: Tích hợp middleware body-parser để parse dữ liệu JSON từ client gửi lên."
            ]
          }
        ]
      },
      {
        "id": "dev-m1",
        "title": "[DevOps] Module 1: Triển khai liên tục (CI/CD) & Docker",
        "shortDesc": "Làm chủ quy trình commit, branch, merge conflict và cộng tác nhóm qua Pull Requests.",
        "lessons": [
          {
            "id": "dev-w1",
            "title": "Bài 1: Git Core: Commit & Khởi tạo dự án",
            "duration": "2.5 giờ",
            "objectives": [
              "Hiểu 3 phân vùng của Git (Working Directory, Staging Area, Local Repository).",
              "Sử dụng các lệnh git init, add, commit, status, log.",
              "Cấu hình tệp tin .gitignore chính xác."
            ],
            "content": "### 1. Quy trình làm việc với Git\nGit quản lý các phiên bản bằng cách chụp ảnh nhanh (snapshots) trạng thái thư mục:\n```bash\ngit init\ngit add .\ngit commit -m 'feat: initial project structure'\n```"
          },
          {
            "id": "dev-w2",
            "title": "Bài 2: Nhánh & Hợp nhất nhánh trong Git",
            "duration": "2.5 giờ",
            "objectives": [
              "Tạo và chuyển đổi nhánh bằng git branch, git checkout.",
              "Thực hiện gộp nhánh (merge) và giải quyết xung đột mã nguồn (Conflicts).",
              "Hiểu về Git Flow tiêu chuẩn."
            ],
            "content": "### 1. Merge Conflicts\nXảy ra khi hai nhánh cùng sửa đổi một dòng code trong cùng một file. Bạn phải mở file trên VS Code và lựa chọn phiên bản giữ lại:\n```text\n<<<<<<< HEAD\ncode trên nhánh hiện tại\n=======\ncode trên nhánh trộn vào\n>>>>>>> feature\n```"
          }
        ],
        "labs": [
          {
            "id": "dev-lab1",
            "title": "Lab 1: Giả lập quy trình giải quyết xung đột Merge Conflict",
            "description": "Thực hiện tạo hai nhánh tính năng cùng sửa đổi một dòng trong file README.md, tiến hành merge để kích hoạt xung đột và sửa lỗi thủ công trên VS Code.",
            "steps": [
              "Bước 1: Tạo repo local và tạo nhánh `main` chứa file text.",
              "Bước 2: Tạo nhánh `feature-a` và `feature-b`, sửa cùng một dòng trong file text đó và commit.",
              "Bước 3: Chuyển về main, merge feature-a (thành công), merge feature-b (xung đột). Tiến hành giải quyết."
            ]
          }
        ]
      },
      {
        "id": "web3-m1",
        "title": "[Web3: Ethereum, Solidity & DApps] Module 1: Lập trình Hợp đồng Thông minh Solidity",
        "shortDesc": "Làm chủ ngôn ngữ Solidity, cấu trúc EVM, các kiểu dữ liệu và triển khai contract trên Remix.",
        "lessons": [
          {
            "id": "web3-w1",
            "title": "Bài 1: Nguyên lý Blockchain & Cấu trúc EVM",
            "duration": "2.5 giờ",
            "objectives": [
              "Hiểu mạng ngang hàng (P2P), cơ chế đồng thuận Proof of Work / Proof of Stake.",
              "Cấu hình ví MetaMask kết nối mạng thử nghiệm Sepolia Testnet.",
              "Hiểu kiến trúc máy ảo Ethereum Virtual Machine (EVM)."
            ],
            "content": "### 1. Kiến trúc khối Blockchain\nMỗi khối (block) chứa dữ liệu giao dịch, chỉ số nonce, hash của khối trước và hash của khối hiện tại.\n### 2. MetaMask Wallet\nVí MetaMask giúp người dùng lưu trữ khóa bí mật (Private Key) và ký các giao dịch chuyển tiền trực tiếp trên trình duyệt Web."
          },
          {
            "id": "web3-w2",
            "title": "Bài 2: Solidity & Remix IDE",
            "duration": "2.5 giờ",
            "objectives": [
              "Sử dụng môi trường Remix IDE để viết và compile contract.",
              "Hiểu cấu trúc một file contract Solidity và các phiên bản compiler.",
              "Thực hiện deploy contract giả lập trên JavaScript VM."
            ],
            "content": "### 1. Hợp đồng thông minh Solidity đầu tiên\n```solidity\n// SPDX-License-Identifier: MIT\npragma solidity ^0.8.0;\n\ncontract Storage {\n    uint256 number;\n    function store(uint256 num) public {\n        number = num;\n    }\n    function retrieve() public view returns (uint256){\n        return number;\n    }\n}\n```"
          }
        ],
        "labs": [
          {
            "id": "web3-lab1",
            "title": "Lab 1: Viết và Triển khai Contract Ngân hàng phi tập trung",
            "description": "Lập trình một contract Solidity cho phép nạp tiền (deposit), rút tiền (withdraw) kèm theo cơ chế lưu trữ số dư của từng tài khoản sử dụng mapping.",
            "steps": [
              "Bước 1: Tạo file Bank.sol trong Remix IDE và khai báo mapping từ address sang uint.",
              "Bước 2: Viết hàm deposit nhận tiền gửi (payable) và cập nhật số dư.",
              "Bước 3: Viết hàm withdraw kiểm tra điều kiện ví người gửi có đủ tiền (require) trước khi chuyển."
            ]
          }
        ]
      },
      {
        "id": "do-m1",
        "title": "[Cloud Computing] Module 1: Quản lý Hạ tầng Đám mây & Kubernetes",
        "shortDesc": "Làm quen với nền tảng AWS/GCP, Linux Server và quản trị hạ tầng tự động hóa với Terraform.",
        "lessons": [
          {
            "id": "do-w1",
            "title": "Bài 1: Linux Administration & AWS/GCP Basics",
            "duration": "2.5 giờ",
            "objectives": [
              "Hiểu các dịch vụ cốt lõi của Cloud: Compute (EC2), Storage (S3), IAM.",
              "Quản lý máy chủ ảo Linux, SSH Key, phân quyền (chmod, chown).",
              "Viết Shell Script cơ bản để tự động hóa cronjob."
            ],
            "content": "### 1. Cloud Computing Basics\nTìm hiểu sự khác biệt giữa IaaS, PaaS và SaaS. Khởi tạo một Virtual Machine trên AWS (EC2).\n### 2. Linux & SSH\nSử dụng SSH để truy cập vào máy chủ từ xa an toàn bằng Key Pair thay vì mật khẩu."
          },
          {
            "id": "do-w2",
            "title": "Bài 2: Infrastructure as Code (IaC) với Terraform",
            "duration": "2.5 giờ",
            "objectives": [
              "Khái niệm IaC và lợi ích của Terraform so với cấu hình thủ công.",
              "Viết file cấu hình HCL để khởi tạo kiến trúc VPC và Subnet.",
              "Thực thi các lệnh terraform init, plan, apply, và destroy."
            ],
            "content": "### 1. Terraform HCL\n```hcl\nresource \"aws_instance\" \"web\" {\n  ami           = \"ami-0c55b159cbfafe1f0\"\n  instance_type = \"t2.micro\"\n  tags = {\n    Name = \"HelloWorld\"\n  }\n}\n```\n### 2. Quản lý State\nHiểu về file `terraform.tfstate` để theo dõi trạng thái hệ thống hiện tại."
          }
        ],
        "labs": [
          {
            "id": "do-lab1",
            "title": "Lab 1: Triển khai Cụm Máy Chủ Web Tự Động Bằng Terraform",
            "description": "Thực hành viết cấu hình Terraform để tự động tạo một mạng VPC mới, cấu hình Security Group (Mở port 80/22) và khởi chạy một EC2 instance cài sẵn Nginx.",
            "steps": [
              "Bước 1: Cài đặt AWS CLI và Terraform, cấu hình Access Key.",
              "Bước 2: Viết các file main.tf, variables.tf, outputs.tf định nghĩa tài nguyên.",
              "Bước 3: Chạy `terraform apply` và kiểm tra trang web Nginx qua Public IP."
            ]
          }
        ]
      },
      {
        "id": "rn-m1",
        "title": "[Mobile App Development: React Native] Module 1: React Native Core & UI Components",
        "shortDesc": "Cài đặt môi trường Expo và xây dựng giao diện di động bằng các Native Components.",
        "lessons": [
          {
            "id": "rn-w1",
            "title": "Bài 1: Nhập môn React Native & Expo",
            "duration": "2.5 giờ",
            "objectives": [
              "Hiểu kiến trúc React Native và sự khác biệt với Web DOM.",
              "Khởi tạo dự án bằng Expo CLI.",
              "Chạy ứng dụng đầu tiên trên điện thoại bằng Expo Go."
            ],
            "content": "### 1. Kiến trúc React Native\nSử dụng JavaScript Core để gọi các Native API của iOS/Android thay vì dùng WebView.\n### 2. Expo CLI\nCông cụ tuyệt vời giúp bắt đầu phát triển ứng dụng di động nhanh chóng mà không cần cài đặt Android Studio hay Xcode phức tạp."
          },
          {
            "id": "rn-w2",
            "title": "Bài 2: Core Components & Styling Flexbox",
            "duration": "2.5 giờ",
            "objectives": [
              "Sử dụng View, Text, Image, TextInput, ScrollView.",
              "Áp dụng StyleSheet để định dạng giao diện.",
              "Bố cục màn hình bằng Flexbox."
            ],
            "content": "### 1. StyleSheet API\n```javascript\nconst styles = StyleSheet.create({\n  container: {\n    flex: 1,\n    justifyContent: 'center',\n    alignItems: 'center'\n  }\n});\n```\n### 2. Flexbox trong React Native\nMặc định flexDirection là 'column' (khác với web là 'row')."
          }
        ],
        "labs": [
          {
            "id": "rn-lab1",
            "title": "Lab 1: Xây Dựng Giao Diện Đăng Nhập (Login Screen)",
            "description": "Thực hành thiết kế màn hình đăng nhập cơ bản bao gồm Logo, Input Email/Password và Button đăng nhập.",
            "steps": [
              "Bước 1: Khởi tạo dự án Expo mới.",
              "Bước 2: Sử dụng TextInput và thiết lập giao diện bằng Flexbox.",
              "Bước 3: Hiển thị ứng dụng trên thiết bị di động thật qua Expo Go."
            ]
          }
        ]
      }
    ]
  },
  "3_INFRA_NETWORKING": {
    "id": "3_INFRA_NETWORKING",
    "title": "Infrastructure & Networking",
    "shortDesc": "Vận hành mạng máy tính và cơ sở hạ tầng viễn thông.",
    "syllabus": [
      {
        "id": "nw-m1",
        "title": "[Networking: Cisco CCNA (200-301)] Module 1: Nền tảng Mạng & Chuyển mạch VLAN",
        "shortDesc": "Tìm hiểu mô hình OSI, TCP/IP và cấu hình cơ bản thiết bị Layer 2.",
        "lessons": [
          {
            "id": "nw-w1",
            "title": "Bài 1: Nền tảng Mạng (Network Fundamentals)",
            "duration": "2.5 giờ",
            "objectives": [
              "Hiểu rõ chức năng các tầng trong mô hình OSI và TCP/IP.",
              "Phân biệt được các loại cáp và thiết bị mạng cơ bản.",
              "Sử dụng Packet Tracer để vẽ sơ đồ mạng."
            ],
            "content": "### 1. Mô hình OSI 7 lớp\n- Physical: Truyền bit vật lý qua môi trường mạng.\n- Data Link: Đóng gói khung (frame) với địa chỉ MAC (Switch).\n- Network: Định tuyến các gói tin (packet) dựa vào địa chỉ IP (Router).\n### 2. Mô hình TCP/IP\nGồm 4 lớp: Application, Transport, Internet, Network Access."
          },
          {
            "id": "nw-w2",
            "title": "Bài 2: Chuyển mạch mạng LAN (Switching & VLANs)",
            "duration": "2.5 giờ",
            "objectives": [
              "Cấu hình cơ bản Switch (Hostname, Password).",
              "Phân chia mạng nội bộ bằng VLAN (Virtual LAN).",
              "Cấu hình đường Trunking (802.1Q) giữa các Switch."
            ],
            "content": "### 1. Cấu hình VLAN trên Cisco Switch\n```bash\nSwitch> enable\nSwitch# configure terminal\nSwitch(config)# vlan 10\nSwitch(config-vlan)# name KETOAN\nSwitch(config-vlan)# exit\n```\n### 2. Gán cổng vào VLAN\n```bash\nSwitch(config)# interface f0/1\nSwitch(config-if)# switchport mode access\nSwitch(config-if)# switchport access vlan 10\n```"
          }
        ],
        "labs": [
          {
            "id": "nw-lab1",
            "title": "Lab 1: Thiết kế mạng VLAN đa phòng ban",
            "description": "Thực hành thiết kế một mạng nội bộ cho 3 phòng ban trên 2 Switch phân tán, đảm bảo cô lập bằng VLAN và cho phép giao tiếp giữa Switch qua đường Trunk.",
            "steps": [
              "Bước 1: Kéo thả 2 Switch 2960 và 6 PC vào không gian làm việc của Packet Tracer.",
              "Bước 2: Cấu hình tạo VLAN 10, 20, 30 trên cả 2 Switch.",
              "Bước 3: Gán các cổng PC vào đúng VLAN và cấu hình Trunking cho cổng Gigabit kết nối 2 Switch."
            ]
          }
        ]
      },
      {
        "id": "sa-m1",
        "title": "[System Administration] Module 1: Quản trị Hệ điều hành Máy chủ",
        "shortDesc": "Tìm hiểu và vận hành hệ điều hành Linux/Windows Server trong môi trường doanh nghiệp.",
        "lessons": [
          {
            "id": "sa-w1",
            "title": "Bài 1: Nhập môn Máy chủ & File System",
            "duration": "2.5 giờ",
            "objectives": [
              "Phân biệt Desktop và Server.",
              "Thao tác trên giao diện dòng lệnh (CLI).",
              "Quản lý File System, User và Phân quyền (Permissions)."
            ],
            "content": "### 1. Phân quyền trong Linux (chmod)\n- `r` (Read = 4), `w` (Write = 2), `x` (Execute = 1).\n- Lệnh `chmod 755 file.sh` cấp quyền cho Owner (đầy đủ), Group (đọc/thực thi), Others (đọc/thực thi)."
          },
          {
            "id": "sa-w2",
            "title": "Bài 2: Tự động hóa với Shell Scripting & Crontab",
            "duration": "2.5 giờ",
            "objectives": [
              "Viết Bash Script tự động hóa tác vụ.",
              "Lập lịch chạy script định kỳ với Crontab."
            ],
            "content": "### 1. Lập lịch sao lưu với Cron\nThêm dòng sau vào crontab để chạy script sao lưu vào 2h sáng mỗi ngày:\n`0 2 * * * /opt/scripts/backup.sh`"
          }
        ],
        "labs": [
          {
            "id": "sa-lab1",
            "title": "Lab 1: Cài đặt và Bảo mật Web Server (LAMP Stack)",
            "description": "Cài đặt Ubuntu Server, thiết lập Apache, MySQL, PHP. Cấu hình tường lửa UFW và chống tấn công dò mật khẩu bằng Fail2ban.",
            "steps": [
              "Bước 1: Triển khai Ubuntu Server qua VirtualBox.",
              "Bước 2: Cài đặt gói `apache2`, `mysql-server`, `php`.",
              "Bước 3: Bật tường lửa `ufw allow 80` và `ufw allow 22`."
            ]
          }
        ]
      }
    ]
  },
  "4_CYBERSECURITY": {
    "id": "4_CYBERSECURITY",
    "title": "Cybersecurity",
    "shortDesc": "Bảo mật hệ thống, mật mã học và Ethical Hacking.",
    "syllabus": [
      {
        "id": "sec-m1",
        "title": "[System & App Security] Module 1: Bảo mật Hệ thống & CEH v12",
        "shortDesc": "Tìm kiếm lỗ hổng, thiết lập tường lửa và phát hiện xâm nhập.",
        "lessons": [
          {
            "id": "sec-w1",
            "title": "Bài 1: Tổng quan Ethical Hacking & Kali Linux",
            "duration": "2.5 giờ",
            "objectives": [
              "Giới thiệu các công cụ dò quét trên Kali Linux.",
              "Phân tích lỗ hổng phổ biến (OWASP Top 10)."
            ],
            "content": "Sử dụng Nmap để quét cổng mạng, Metasploit để kiểm thử xâm nhập."
          }
        ],
        "labs": []
      },
      {
        "id": "crypto-m1",
        "title": "[Cryptography] Module 1: Mật mã học Ứng dụng",
        "shortDesc": "Nghiên cứu thuật toán mã hóa bảo vệ quyền riêng tư, ứng dụng trong ngân hàng và Blockchain.",
        "lessons": [
          {
            "id": "crypto-w1",
            "title": "Bài 1: Nhập môn Mật mã học & Lịch sử mã hoá",
            "duration": "2.5 giờ",
            "objectives": [
              "Từ mã Caesar cổ đại đến mã hóa Enigma.",
              "Hiểu các khái niệm cơ bản: Plaintext, Ciphertext, Encryption, Decryption, Key."
            ],
            "content": "### 1. Plaintext & Ciphertext\nBản rõ (Plaintext) là dữ liệu chưa mã hoá. Bản mã (Ciphertext) là dữ liệu đã qua mã hoá."
          },
          {
            "id": "crypto-w2",
            "title": "Bài 2: Mã hóa đối xứng (Symmetric Encryption)",
            "duration": "2.5 giờ",
            "objectives": [
              "Nghiên cứu nguyên lý hoạt động của DES, 3DES và AES.",
              "Ứng dụng mã hoá file bằng Python (Cryptography library)."
            ],
            "content": "### 1. AES (Advanced Encryption Standard)\nThuật toán mã hóa đối xứng phổ biến nhất hiện nay. Sử dụng chung 1 khoá cho cả việc mã hoá và giải mã."
          }
        ],
        "labs": [
          {
            "id": "crypto-lab1",
            "title": "Lab 1: Ứng dụng Nhắn tin Bảo mật End-to-End",
            "description": "Sử dụng Python Socket để viết ứng dụng Client-Server mã hoá hoàn toàn bằng khoá bất đối xứng kết hợp đối xứng.",
            "steps": [
              "Bước 1: Tạo khoá Public/Private (RSA) bằng Python.",
              "Bước 2: Xây dựng máy chủ Server trung gian điều hướng tin nhắn.",
              "Bước 3: Mã hoá tin nhắn trên Client trước khi gửi."
            ]
          }
        ]
      }
    ]
  },
  "5_GRAPHICS_HCI": {
    "id": "5_GRAPHICS_HCI",
    "title": "Computer Graphics & HCI",
    "shortDesc": "Đồ hoạ, Game 2D/3D và thiết kế tương tác thực tế ảo.",
    "syllabus": [
      {
        "id": "uiux-m1",
        "title": "[UI/UX Design] Module 1: Thiết kế Giao diện & Trải nghiệm Người dùng",
        "shortDesc": "Từ nghiên cứu hành vi người dùng đến việc tạo nguyên mẫu tương tác bằng Figma.",
        "lessons": [
          {
            "id": "uiux-w1",
            "title": "Bài 1: Nhập môn UI/UX & Design Thinking",
            "duration": "2.5 giờ",
            "objectives": [
              "Sự khác biệt giữa UI (User Interface) và UX (User Experience).",
              "Áp dụng quy trình Design Thinking: Empathize, Define, Ideate, Prototype, Test."
            ],
            "content": "### 1. User Persona\nTạo chân dung khách hàng giả định để định hướng thiết kế."
          }
        ],
        "labs": []
      },
      {
        "id": "gd-m1",
        "title": "[VR & Game Dev] Module 1: Unity Editor & C# Scripting",
        "shortDesc": "Làm quen giao diện Unity, vật lý 2D và lập trình điều khiển nhân vật cơ bản.",
        "lessons": [
          {
            "id": "gd-w1",
            "title": "Bài 1: Nhập môn Game Dev & Unity Engine",
            "duration": "2.5 giờ",
            "objectives": [
              "Cài đặt Unity Hub và tạo Project 2D mới.",
              "Khám phá các cửa sổ Scene, Game, Hierarchy, Inspector.",
              "Hiểu khái niệm cốt lõi: GameObject và Component."
            ],
            "content": "### 1. GameObject và Component\nMọi thực thể trong Game đều là GameObject. Hành vi và thuộc tính của chúng được quyết định bởi các Component (Vật lý, Hình ảnh, Âm thanh, Mã lệnh) gắn kèm.\n### 2. Không gian toạ độ\nLàm quen với trục toạ độ X, Y trong môi trường 2D."
          },
          {
            "id": "gd-w2",
            "title": "Bài 2: C# Basics & Điều Khiển Nhân Vật",
            "duration": "2.5 giờ",
            "objectives": [
              "Tạo C# Script và gắn vào GameObject.",
              "Lấy Input từ bàn phím người chơi.",
              "Lập trình di chuyển (Translation) nhân vật."
            ],
            "content": "### 1. Unity C# Script\n```csharp\nvoid Update() {\n    float move = Input.GetAxis(\"Horizontal\");\n    transform.Translate(new Vector3(move * speed * Time.deltaTime, 0, 0));\n}\n```\n### 2. Hàm Update() vs FixedUpdate()\nHàm Update gọi mỗi frame (xử lý Input), hàm FixedUpdate gọi theo chu kỳ cố định (xử lý Vật lý)."
          }
        ],
        "labs": [
          {
            "id": "gd-lab1",
            "title": "Lab 1: Nhân Vật Chạy Nhảy Cơ Bản",
            "description": "Thực hành thiết lập một nhân vật có thể di chuyển trái/phải và nhảy lên các bục (Platform) dựa trên Input của người chơi và lực hấp dẫn (Gravity).",
            "steps": [
              "Bước 1: Import hình ảnh nhân vật (Sprite) và bục nhảy.",
              "Bước 2: Gắn BoxCollider2D và Rigidbody2D cho các vật thể.",
              "Bước 3: Viết C# Script lấy Input và áp dụng lực (AddForce) để nhân vật nhảy lên."
            ]
          }
        ]
      },
      {
        "id": "ue-m1",
        "title": "[Game Development: Unity 2D & Unreal Engine 3D] Module 2: Unreal Engine 5 & C++ RPG",
        "shortDesc": "Kết hợp Blueprints và C++ để tạo cơ chế chiến đấu nhập vai hành động (Soulslike).",
        "lessons": [
          {
            "id": "ue-w1",
            "title": "Bài 1: Nhập môn UE5 & Cấu trúc C++",
            "duration": "2.5 giờ",
            "objectives": [
              "Làm quen giao diện UE5, hệ thống chiếu sáng Lumen, Nanite.",
              "Khởi tạo dự án C++ Third Person.",
              "Khai báo UCLASS, UPROPERTY, UFUNCTION cơ bản."
            ],
            "content": "### 1. Hybrid Development\nSử dụng C++ cho logic tính toán (Sát thương, Máu) và Blueprints cho giao diện, Animation.\n### 2. Unreal C++ Macros\nCác macro giúp Engine nhận diện biến và hàm C++ trong Editor."
          },
          {
            "id": "ue-w2",
            "title": "Bài 2: Animation & Hitbox Sát thương",
            "duration": "2.5 giờ",
            "objectives": [
              "Sử dụng Animation Montages cho các đòn đánh.",
              "Gắn Anim Notifies để kích hoạt logic đúng thời điểm vung kiếm.",
              "Sử dụng Line Trace (Raycast) để xét va chạm Hitbox cực chuẩn."
            ],
            "content": "### 1. Line Trace (Raycast)\nThay vì dùng Capsule Collider dễ gây sai lệch, dùng tia Line Trace dọc theo vũ khí mỗi khung hình để kiểm tra chém trúng địch.\n### 2. Animation Retargeting\nTái sử dụng hoạt ảnh (Animations) từ Mixamo sang khung xương chuẩn của Unreal."
          }
        ],
        "labs": [
          {
            "id": "ue-lab1",
            "title": "Lab 2: Cơ Chế Chém Trúng (Melee Hit Detection)",
            "description": "Thực hành lập trình C++ phát tia Line Trace từ thanh kiếm và xử lý logic trừ máu quái vật khi vũ khí chạm vào.",
            "steps": [
              "Bước 1: Khai báo hàm xử lý Line Trace trong C++.",
              "Bước 2: Gắn Anim Notifies vào Animation Montage của đòn đánh để gọi hàm trên.",
              "Bước 3: Phát hiệu ứng toé lửa (Niagara) tại điểm va chạm (Hit Result)."
            ]
          }
        ]
      }
    ]
  },
  "6_HARDWARE_EMBEDDED": {
    "id": "6_HARDWARE_EMBEDDED",
    "title": "Hardware & Embedded Systems",
    "shortDesc": "Lập trình vi điều khiển, phần cứng và Internet vạn vật (IoT).",
    "syllabus": [
      {
        "id": "chip-m1",
        "title": "[Chip Design] Module 1: Vi mạch Kỹ thuật số & Kiến trúc Máy tính",
        "shortDesc": "Từ cổng logic bán dẫn cơ bản đến việc tự chế tạo bộ vi xử lý trên FPGA.",
        "lessons": [
          {
            "id": "chip-w1",
            "title": "Bài 1: Mạch Logic & Đại số Boole",
            "duration": "2.5 giờ",
            "objectives": [
              "Làm quen với các cổng logic cơ bản (AND, OR, NOT).",
              "Sử dụng phần mềm Logisim mô phỏng mạch điện."
            ],
            "content": "### 1. Cổng Logic\nNền tảng của mọi hệ thống máy tính.\n### 2. Bảng chân lý\nCách biểu diễn toán học hoạt động của cổng."
          }
        ],
        "labs": []
      },
      {
        "id": "iot-m1",
        "title": "[Phần Cứng & IoT] Module 1: Từ Arduino đến Smart Home",
        "shortDesc": "Làm quen linh kiện điện tử, vi điều khiển C++ và kết nối vạn vật.",
        "lessons": [
          {
            "id": "iot-w1",
            "title": "Bài 1: Nhập môn Điện tử & Arduino",
            "duration": "2.5 giờ",
            "objectives": [
              "Làm quen Breadboard, LED, Điện trở.",
              "Cấu trúc chương trình C++ trên Arduino IDE.",
              "Chớp tắt LED."
            ],
            "content": "### 1. Arduino UNO\nBo mạch vi điều khiển phổ biến nhất thế giới.\n### 2. Cấu trúc C++\nGồm setup() chạy 1 lần và loop() chạy vô hạn."
          },
          {
            "id": "iot-w2",
            "title": "Bài 2: Tín hiệu Số & Nút nhấn",
            "duration": "2.0 giờ",
            "objectives": [
              "Đọc tín hiệu Digital.",
              "Xử lý chống rung phím (Debounce)."
            ],
            "content": "Sử dụng lệnh digitalRead() để đọc trạng thái nút nhấn và digitalWrite() để điều khiển thiết bị khác dựa trên trạng thái đó."
          }
        ],
        "labs": [
          {
            "id": "iot-lab1",
            "title": "Lab 1: Hệ thống đèn cầu thang thông minh",
            "description": "Thiết kế mạch có 2 công tắc ở 2 đầu cầu thang điều khiển chung 1 bóng đèn.",
            "steps": [
              "Bước 1: Lắp mạch 2 nút nhấn và 1 LED.",
              "Bước 2: Lập trình C++ thay đổi trạng thái đèn mỗi khi 1 trong 2 nút được nhấn."
            ]
          }
        ]
      }
    ]
  }
};
