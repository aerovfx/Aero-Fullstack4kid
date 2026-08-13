# Tuần 10: Penetration Testing, SOC Operations & Capstone Project (CEH v12 Module 20 Aligned)

## Mục Tiêu / Objectives (CEH v12 Aligned)

### Vietnamese (Tiếng Việt)
- Hiểu được các nguyên tắc cơ bản của trung tâm điều hành bảo mật (SOC - Security Operations Center) và vai trò thiết yếu của tự động hóa trong việc xử lý khối lượng lớn dữ liệu an ninh mạng.
- Khám phá cách Trí tuệ nhân tạo (AI) và Học máy (Machine Learning - ML) có thể nâng cao khả năng phân tích nhật ký (log analysis) và phát hiện mối đe dọa trong thời gian thực.
- Thiết kế và phát triển một công cụ giám sát bảo mật cơ bản tích hợp AI để phân tích nhật ký truy cập mạng.
- Thực hành xây dựng các cơ chế cảnh báo tự động khi mô hình máy học phát hiện ra các mẫu hành vi bất thường.
- Ôn tập và tổng hợp lại các kiến thức phòng thủ đã học trong toàn bộ khóa học 10 tuần, từ an ninh mạng, mã hóa, đến phòng ngừa phần mềm độc hại.
- Nhận thức sâu sắc được các giới hạn của AI trong bảo mật (ví dụ: thiên lệch dữ liệu, đầu độc mô hình) và tầm quan trọng của sự giám sát từ con người (Human-in-the-loop).

### English
- Understand the core principles of a Security Operations Center (SOC) and the essential role of automation in handling large volumes of cybersecurity data.
- Explore how Artificial Intelligence (AI) and Machine Learning (ML) can enhance log analysis and real-time threat detection capabilities.
- Design and develop a basic AI-integrated security monitoring tool to analyze network access logs.
- Practice building automated alerting mechanisms when the machine learning model detects anomalous behavior patterns.
- Review and synthesize the defensive security concepts learned throughout the entire 10-week course, from network security and cryptography to malware prevention.
- Deeply recognize the limitations of AI in cybersecurity (e.g., data bias, model poisoning) and the critical importance of human-in-the-loop oversight.

---

## Linh Kiện & Dụng Cụ / Components & Tools

### Vietnamese (Tiếng Việt)
- **Phần cứng:** Máy tính cá nhân (Laptop/PC) với hệ điều hành Windows 10/11, macOS 10.15+, hoặc các bản phân phối Linux phổ biến (Ubuntu, Fedora). Yêu cầu cấu hình tối thiểu RAM 4GB để chạy các mô hình AI nhỏ.
- **Phần mềm cốt lõi:** Môi trường lập trình Python phiên bản 3.8 trở lên đã được cài đặt.
- **Công cụ phát triển (IDE):** Visual Studio Code (khuyên dùng với extension Python), PyCharm Community Edition, hoặc Jupyter Notebook (rất tốt cho việc biểu diễn dữ liệu và chạy từng dòng mã).
- **Thư viện Python cần thiết:** `pandas` (xử lý dữ liệu bảng), `scikit-learn` (chứa các thuật toán học máy như Isolation Forest), `matplotlib` (vẽ biểu đồ trực quan hóa dữ liệu), `numpy` (tính toán ma trận và mảng).
- **Dữ liệu:** Mẫu nhật ký truy cập mạng giả lập (Synthetic network access logs) phục vụ cho việc huấn luyện và kiểm thử mô hình. Dữ liệu này sẽ được tạo trực tiếp bằng mã Python trong phần thực hành.
- **Khác:** Kết nối Internet ổn định để cài đặt thư viện qua `pip` và tra cứu tài liệu mở rộng (StackOverflow, Scikit-learn Documentation).

### English
- **Hardware:** Personal Computer (Laptop/Desktop) running Windows 10/11, macOS 10.15+, or common Linux distributions (Ubuntu, Fedora). Minimum 4GB RAM required to run small AI models.
- **Core Software:** Python programming environment version 3.8 or higher installed.
- **Development Tools (IDE):** Visual Studio Code (recommended with Python extension), PyCharm Community Edition, or Jupyter Notebook (excellent for data visualization and running code line-by-line).
- **Required Python Libraries:** `pandas` (tabular data manipulation), `scikit-learn` (machine learning algorithms like Isolation Forest), `matplotlib` (data visualization and plotting), `numpy` (matrix and array computations).
- **Data:** Synthetic network access log samples for model training and testing. This data will be generated directly via Python code in the hands-on section.
- **Other:** Stable Internet connection to install libraries via `pip` and reference external documentation (StackOverflow, Scikit-learn Documentation).

---

## Lý Thuyết / Theory

### 1. Tổng quan về Trung tâm Điều hành Bảo mật (SOC) / Overview of Security Operations Center (SOC)

#### Tiếng Việt
Trung tâm điều hành bảo mật (SOC) là trung tâm đầu não của một tổ chức về an ninh mạng. Đây là một cơ sở tập trung (hoặc một nhóm được tổ chức chặt chẽ) nơi các chuyên gia bảo mật thông tin liên tục giám sát, phân tích và phản ứng với các sự cố bảo mật 24/7. Các thành phần cốt lõi của một SOC bao gồm:
- **Con người (People):** Sự phân chia cấp bậc rõ ràng bao gồm các chuyên gia phân tích bảo mật cấp 1 (Triage/Phân loại), cấp 2 (Incident Response/Ứng phó sự cố), cấp 3 (Threat Hunting/Săn mối đe dọa), kỹ sư bảo mật, và người quản lý SOC.
- **Quy trình (Processes):** Các quy trình vận hành tiêu chuẩn (Standard Operating Procedures - SOPs), cẩm nang ứng phó sự cố (Incident Response Playbooks) cho từng loại tấn công cụ thể (Ransomware, Phishing, DDoS), và các biện pháp leo thang đặc quyền khi cần thiết.
- **Công nghệ (Technology):** Hệ thống quản lý thông tin và sự kiện bảo mật (SIEM), công cụ phát hiện và phản hồi điểm cuối (EDR), tường lửa thế hệ mới (NGFW), và hệ thống phát hiện/ngăn chặn xâm nhập (IDS/IPS).

Trong môi trường mạng phức tạp hiện đại, số lượng cảnh báo bảo mật (security alerts) được tạo ra mỗi ngày bởi tường lửa và phần mềm diệt virus có thể lên tới hàng chục nghìn. Điều này gây ra hiện tượng "mệt mỏi vì cảnh báo" (alert fatigue) cho các chuyên gia, dẫn đến nguy cơ bỏ lót các cảnh báo thực sự quan trọng. Đây chính là lúc tự động hóa (Automation) và Trí tuệ nhân tạo (AI) đóng vai trò vô cùng quan trọng như một "lớp lọc" thông minh.

#### English
A Security Operations Center (SOC) is the command center of an organization's cybersecurity. It is a centralized facility (or a tightly organized team) where information security professionals continuously monitor, analyze, and respond to security incidents 24/7. The core components of a SOC include:
- **People:** A clear hierarchical structure including Tier 1 (Triage), Tier 2 (Incident Response), and Tier 3 (Threat Hunting) Security Analysts, Security Engineers, and SOC Managers.
- **Processes:** Standard Operating Procedures (SOPs), Incident Response Playbooks tailored for specific attack types (Ransomware, Phishing, DDoS), and defined escalation paths when necessary.
- **Technology:** Security Information and Event Management (SIEM) systems, Endpoint Detection and Response (EDR) tools, Next-Generation Firewalls (NGFW), and Intrusion Detection/Prevention Systems (IDS/IPS).

In complex modern network environments, the volume of security alerts generated daily by firewalls and antivirus software can reach tens of thousands. This massive volume causes "alert fatigue" for analysts, leading to the dangerous risk of missing truly critical alerts. This is precisely where Automation and Artificial Intelligence (AI) play an essential role as an intelligent "filtration layer."

### 2. Tự động hóa Bảo mật & SOAR / Security Automation & SOAR

#### Tiếng Việt
Tự động hóa bảo mật là việc sử dụng công nghệ để thực hiện các quy trình bảo mật mà không cần (hoặc cần rất ít) sự can thiệp thủ công của con người. Khái niệm cao cấp nhất của lĩnh vực này hiện nay là SOAR (Security Orchestration, Automation, and Response) - một tập hợp các công nghệ phần mềm được thiết kế để giải quyết các thách thức vận hành:
- **Điều phối (Orchestration):** Đóng vai trò như một chất keo kết dính, kết nối nhiều công cụ bảo mật khác nhau (của nhiều hãng khác nhau, cả nội bộ và bên ngoài) thông qua API để chúng hoạt động cùng nhau một cách trơn tru.
- **Tự động hóa (Automation):** Thực hiện các tác vụ điều tra lặp đi lặp lại tự động. Ví dụ: Khi có một địa chỉ IP lạ quét mạng nội bộ, công cụ tự động hóa sẽ tự truy vấn các cơ sở dữ liệu tình báo mối đe dọa (Threat Intelligence) như VirusTotal để kiểm tra xem IP đó có danh tiếng xấu hay không.
- **Phản ứng (Response):** Thực thi các hành động khắc phục nhanh chóng dựa trên các kịch bản đã được xác định trước. Ví dụ: Nếu một máy tính bị xác định là nhiễm phần mềm độc hại, hệ thống có thể tự động cấu hình switch mạng để đưa máy tính đó vào một VLAN cô lập, ngăn chặn mã độc lây lan (lateral movement).

#### English
Security automation is the use of technology to perform security processes without (or with very little) manual human intervention. The most advanced concept in this field today is SOAR (Security Orchestration, Automation, and Response)—a stack of software technologies designed to solve operational challenges:
- **Orchestration:** Acts as the glue, connecting disparate security tools (from various vendors, both internal and external) via APIs so they can operate together seamlessly.
- **Automation:** Automatically performing repetitive investigative tasks. For example, when a strange IP address scans the internal network, the automation tool will automatically query Threat Intelligence databases like VirusTotal to check if the IP has a bad reputation.
- **Response:** Executing rapid remediation actions based on pre-defined playbooks. For instance, if a host is determined to be infected with malware, the system can automatically configure the network switch to place that host in an isolated VLAN, preventing lateral movement of the malicious code.

### 3. Tích hợp AI trong Phân tích Nhật ký (AI Integration in Log Analysis)

#### Tiếng Việt
Trí tuệ nhân tạo, đặc biệt là Học máy (Machine Learning - ML), có thể được áp dụng để cải thiện đáng kể khả năng phân tích dữ liệu khổng lồ của ngành bảo mật. Các hệ thống bảo mật truyền thống thường hoạt động dựa trên các quy tắc tĩnh (rule-based) hoặc chữ ký mã độc (signature-based). Nhược điểm lớn nhất của cách làm này là chúng chỉ phát hiện được các mối đe dọa *đã biết* (known threats).
AI lấp đầy khoảng trống này bằng các khả năng:
- **Phát hiện bất thường (Anomaly Detection):** Hệ thống AI sẽ học một "mô hình cơ sở" (baseline) về hành vi bình thường của mạng hoặc của từng người dùng trong hệ thống (như giờ làm việc, khối lượng dữ liệu tải xuống trung bình). Sau đó, nó sẽ đánh dấu bất kỳ hoạt động nào sai lệch đáng kể so với mô hình chuẩn. Điều này giúp phát hiện các mối đe dọa chưa từng biết đến trước đây (zero-day attacks) hoặc các cuộc tấn công tinh vi lẩn tránh chữ ký.
- **Giảm cảnh báo giả (False Positive Reduction):** Bằng cách phân tích bối cảnh, AI có thể tương quan nhiều điểm dữ liệu để xác định xem một cảnh báo (alert) có thực sự là một cuộc tấn công hay chỉ là một hoạt động quản trị mạng bình thường, giúp chuyên viên tập trung vào các vấn đề nguy hiểm thực sự.
- **Phân tích hành vi thực thể (UEBA - User and Entity Behavior Analytics):** Tập trung vào việc theo dõi hành vi của con người và thiết bị (ví dụ: tài khoản kế toán bỗng nhiên truy cập vào máy chủ mã nguồn của công ty lúc 3 giờ sáng).

Trong bài học này, chúng ta sẽ xây dựng một công cụ sử dụng học không giám sát (unsupervised learning) để tìm kiếm các điểm bất thường.

#### English
Artificial Intelligence, particularly Machine Learning (ML), can be applied to significantly improve the ability to analyze the massive datasets inherent in the security industry. Traditional security systems usually operate based on static rules (rule-based) or malware signatures (signature-based). The biggest drawback of this approach is that they can only detect *known* threats.
AI fills this gap with capabilities such as:
- **Anomaly Detection:** The AI system learns a "baseline model" of normal network behavior or individual user behavior (e.g., standard working hours, average data download volumes). It then flags any activity that significantly deviates from the standard baseline. This helps in detecting previously unknown threats (zero-day attacks) or sophisticated attacks designed to evade signatures.
- **False Positive Reduction:** By analyzing context, AI can correlate multiple data points to determine if an alert is a genuine attack or just normal network administration activity, helping analysts focus on truly dangerous issues.
- **User and Entity Behavior Analytics (UEBA):** Focuses on tracking the behavior of humans and devices (e.g., an accounting user account suddenly accessing the company's source code server at 3:00 AM).

In this lesson, we will build a tool using unsupervised learning to hunt for anomalous data points.

### 4. Thuật toán Isolation Forest / Isolation Forest Algorithm

#### Tiếng Việt
Isolation Forest (Rừng Cô Lập) là một thuật toán học máy nổi tiếng và chuyên dụng dùng để phát hiện bất thường. Đặc điểm nổi bật của nó là sự khác biệt so với các thuật toán truyền thống.
Thay vì cố gắng xây dựng hồ sơ của dữ liệu bình thường (điều đòi hỏi rất nhiều thời gian và dữ liệu), Isolation Forest trực tiếp tìm cách *cô lập* các điểm dữ liệu bất thường.
- **Nguyên lý hoạt động:** Thuật toán xây dựng nhiều "cây quyết định" một cách hoàn toàn ngẫu nhiên (Isolation Trees). Quá trình này chia cắt không gian dữ liệu bằng cách chọn ngẫu nhiên các đặc trưng và giá trị phân tách. Các điểm dữ liệu bất thường (vì có số lượng ít và giá trị rất khác biệt) sẽ nhanh chóng bị cô lập khỏi phần còn lại của dữ liệu ngay ở những lần chia cắt đầu tiên. Do đó, chúng có đường đi ngắn hơn tính từ gốc của cây quyết định.
- **Ưu điểm vượt trội trong Bảo mật:** Rất hiệu quả về mặt tính toán khi đối mặt với dữ liệu có khối lượng khổng lồ và nhiều chiều (như nhật ký lưu lượng mạng). Hơn thế nữa, nó thuộc nhóm học không giám sát (unsupervised learning), nghĩa là chúng ta không cần phải vất vả dán nhãn thủ công hàng triệu dòng log là "an toàn" hay "độc hại" trước khi huấn luyện mô hình.

#### English
Isolation Forest is a famous and specialized machine learning algorithm used for anomaly detection. Its standout feature is its divergence from traditional algorithms.
Instead of trying to build a profile of normal data (which requires extensive time and data), Isolation Forest explicitly attempts to *isolate* anomalous data points directly.
- **Working Principle:** The algorithm builds multiple "decision trees" completely randomly (Isolation Trees). This process partitions the data space by randomly selecting features and split values. Anomalous data points (being few in number and possessing distinct values) are quickly isolated from the rest of the data in the very first few splits. Consequently, they have shorter path lengths from the root of the decision trees.
- **Superior Advantages in Security:** Highly computationally efficient when dealing with massive, multi-dimensional data (like network traffic logs). Furthermore, it belongs to the unsupervised learning category, meaning we do not have to painstakingly manually label millions of log lines as "safe" or "malicious" prior to training the model.

---

## Sơ Đồ Cấu Hình / Diagram

### Hệ thống giám sát bảo mật tự động / Automated Security Monitoring System

```mermaid
graph TD
    A[Nhật ký hệ thống/System Logs] -->|Log Forwarding| B(Bộ thu thập dữ liệu/Data Collector)
    B --> C{Tiền xử lý & Trích xuất đặc trưng/Data Preprocessing & Feature Extraction}
    C --> D[Mô hình AI: Isolation Forest]
    D --> |Hành vi bình thường/Normal (-1)| E[Lưu trữ dài hạn Data Lake/Archive]
    D --> |Hành vi bất thường/Anomaly (1)| F[Hệ thống cảnh báo SOAR/Alerting System]
    F --> G(Tự động phản ứng/Automated Response - e.g. Block IP)
    F --> H[Dashboard Giám sát SOC/SOC Dashboard]
    H --> I((Chuyên gia bảo mật phân tích chuyên sâu/Security Analyst Triage))
    
    style A fill:#f9f,stroke:#333,stroke-width:2px
    style D fill:#bbf,stroke:#333,stroke-width:2px
    style F fill:#f96,stroke:#333,stroke-width:2px
    style I fill:#dfd,stroke:#333,stroke-width:2px
```

---

## Thực Hành / Hands-On

### Phần 1: Cài đặt môi trường và thư viện / Part 1: Environment and Library Setup

**Tiếng Việt:**
Trước tiên, hãy đảm bảo rằng bạn đã cài đặt các thư viện cần thiết. Việc này giúp cung cấp các công cụ toán học và thuật toán AI mạnh mẽ cho Python. Mở terminal, PowerShell hoặc Command Prompt của bạn và chạy lệnh sau:
`pip install pandas scikit-learn matplotlib numpy`

Lưu ý: Nếu bạn đang sử dụng môi trường ảo (virtual environment), hãy kích hoạt nó trước khi chạy lệnh pip. `pandas` được dùng để tạo các bảng dữ liệu tương tự như Excel, `scikit-learn` chứa thuật toán Isolation Forest, và `numpy` hỗ trợ sinh số ngẫu nhiên phức tạp.

**English:**
First, ensure you have installed the necessary libraries. This provides powerful mathematical tools and AI algorithms for Python. Open your terminal, PowerShell, or Command Prompt and run the following command:
`pip install pandas scikit-learn matplotlib numpy`

Note: If you are using a virtual environment, activate it before running the pip command. `pandas` is used to create data tables similar to Excel, `scikit-learn` contains the Isolation Forest algorithm, and `numpy` assists in complex random number generation.

### Phần 2: Xây dựng tập dữ liệu mô phỏng / Part 2: Building the Synthetic Dataset

**Tiếng Việt:**
Do chúng ta không có một hệ thống mạng thực sự đang bị tấn công để thu thập log, chúng ta sẽ tự tạo ra dữ liệu mô phỏng. Dữ liệu này cần có hai nhóm rõ rệt:
- **Lưu lượng sạch (Normal Traffic):** Kích thước tải xuống khoảng vài KB, thời gian kết nối ngắn, số lần thử đăng nhập ít.
- **Lưu lượng tấn công (Malicious/Anomalous Traffic):** Ví dụ như tấn công vét cạn (Brute-force) sẽ có số lần thử đăng nhập cực lớn; hoặc hành vi trộm cắp dữ liệu (Exfiltration) sẽ có lượng bytes tải xuống khổng lồ và thời gian kết nối kéo dài bất thường.

**English:**
Since we do not have a real network currently under attack to collect logs from, we will generate synthetic data. This data needs two distinct groups:
- **Normal Traffic:** Download sizes of a few KBs, short connection times, few login attempts.
- **Malicious/Anomalous Traffic:** For example, Brute-force attacks will have a massive number of login attempts; or Data Exfiltration behavior will feature enormous downloaded bytes and unusually prolonged connection times.

### Phần 3: Xây dựng Mô hình AI và Hệ thống Cảnh báo cơ bản / Part 3: Building the AI Model and Basic Alert System

**Tiếng Việt:**
Chúng ta sẽ áp dụng thuật toán `IsolationForest` từ thư viện `scikit-learn`. Quá trình bao gồm việc nạp dữ liệu vào bảng (DataFrame), huấn luyện mô hình (không cần gán nhãn thủ công) và sau đó dự đoán để phân loại các dòng dữ liệu. 
Cuối cùng, bất cứ khi nào phát hiện dòng dữ liệu bị gắn cờ "bất thường", hệ thống sẽ in ra màn hình các thông số chi tiết mô phỏng hệ thống báo động trực tiếp tại SOC.

**English:**
We will apply the `IsolationForest` algorithm from the `scikit-learn` library. The process involves loading data into a table (DataFrame), training the model (without manual labeling), and then predicting to classify the data rows.
Finally, whenever it detects a data row flagged as "anomalous," the system will print detailed parameters to the screen, simulating a live alarm system at a SOC.

---

## Code Mẫu / Code Samples

### Tập tin: `soc_ai_monitor.py` / File: `soc_ai_monitor.py`

Đoạn mã Python toàn diện dưới đây sẽ mô phỏng một pipeline xử lý bảo mật thu nhỏ: từ việc lấy dữ liệu, phát hiện mối đe dọa bằng AI, đến đưa ra phản hồi.
The comprehensive Python code below simulates a miniature security processing pipeline: from data ingestion, AI threat detection, to generating responses.

```python
"""
soc_ai_monitor.py
Mô phỏng Hệ thống Phát hiện Bất thường dựa trên AI cho Trung tâm Điều hành Bảo mật.
Simulates an AI-based Anomaly Detection System for a Security Operations Center.
"""

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.ensemble import IsolationForest
import datetime
import time

def generate_synthetic_logs(n_samples=2000, n_outliers=100):
    """
    Tạo dữ liệu nhật ký mạng giả lập.
    Generates synthetic network log data.
    """
    print(f"[*] Đang khởi tạo cơ sở dữ liệu mô phỏng: {n_samples} bản ghi sạch, {n_outliers} bản ghi độc hại...")
    
    # Sinh dữ liệu hành vi bình thường (Normal User Behavior)
    # Đặc trưng 1: bytes_transferred (Kích thước gói tin truyền tải - đơn vị bytes)
    # Đặc trưng 2: connection_duration (Thời lượng kết nối - giây)
    # Đặc trưng 3: login_attempts (Số lần cố gắng xác thực)
    normal_data = {
        'bytes_transferred': np.random.normal(5000, 1000, n_samples),
        'connection_duration': np.random.normal(120, 30, n_samples),
        'login_attempts': np.random.poisson(1, n_samples) # Đa số là 0 hoặc 1 lần
    }
    
    # Sinh dữ liệu hành vi tấn công (Anomalous Behavior)
    # Mô phỏng rò rỉ dữ liệu (Exfiltration) hoặc dò mật khẩu (Brute force)
    outlier_data = {
        'bytes_transferred': np.random.uniform(50000, 200000, n_outliers),
        'connection_duration': np.random.uniform(500, 2000, n_outliers),
        'login_attempts': np.random.uniform(20, 150, n_outliers)
    }
    
    # Chuyển đổi sang định dạng Pandas DataFrame
    df_normal = pd.DataFrame(normal_data)
    df_outliers = pd.DataFrame(outlier_data)
    
    # Hợp nhất và xáo trộn ngẫu nhiên toàn bộ dữ liệu (Combine and shuffle)
    df = pd.concat([df_normal, df_outliers])
    df = df.sample(frac=1, random_state=42).reset_index(drop=True)
    return df

def train_isolation_forest(df):
    """
    Huấn luyện mô hình Isolation Forest.
    Trains the Isolation Forest model.
    """
    print("[*] Bắt đầu quá trình huấn luyện mô hình học không giám sát (Isolation Forest)...")
    
    # Tham số contamination = 0.05 ám chỉ kỳ vọng 5% dữ liệu trong tập là bất thường.
    # Trong thực tế, chuyên gia SOC sẽ phải điều chỉnh thông số này dựa trên tỷ lệ tấn công thực.
    model = IsolationForest(n_estimators=100, max_samples='auto', contamination=0.05, random_state=42)
    
    # Tiến hành học đặc trưng dữ liệu (Fit the model)
    model.fit(df)
    print("[+] Hoàn tất huấn luyện mô hình.")
    return model

def monitor_and_alert(model, df):
    """
    Kiểm tra dữ liệu và đưa ra cảnh báo tự động.
    Checks data and triggers automated alerts.
    """
    print("\n=======================================================")
    print("      BẮT ĐẦU GIÁM SÁT THỜI GIAN THỰC (SOC MOCK)       ")
    print("=======================================================")
    
    # Sử dụng mô hình để dự đoán
    # Kết quả trả về: 1 (Bình thường/Inlier) hoặc -1 (Bất thường/Outlier)
    predictions = model.predict(df)
    
    alert_count = 0
    # Duyệt qua các dự đoán để kiểm tra cảnh báo
    for i, pred in enumerate(predictions):
        if pred == -1:
            alert_count += 1
            timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            bytes_t = df.iloc[i]['bytes_transferred']
            conn_d = df.iloc[i]['connection_duration']
            logins = df.iloc[i]['login_attempts']
            
            # Xuất cảnh báo ra Console
            print(f"[{timestamp}] [CRITICAL ALERT] Phát hiện Lưu lượng mạng bất thường!")
            print(f"    + ID Sự kiện (Event ID): {i}")
            print(f"    + Dữ liệu truyền: {bytes_t:.2f} Bytes")
            print(f"    + Thời gian kết nối: {conn_d:.2f} Giây")
            print(f"    + Số lần thử đăng nhập: {logins:.0f} Lần")
            print("    -> [Hành động SOAR]: Gửi API block IP tạm thời tới Tường Lửa (Simulated).")
            print("-" * 50)
            
            # Tạm dừng nhỏ để mô phỏng độ trễ thực tế
            time.sleep(0.15) 
            
        if alert_count >= 15: # Giới hạn hiển thị để console không bị quá tải
            print(f"\n[!] Hệ thống đã phát hiện và ghi nhận hàng loạt cảnh báo. Chuyển sang chế độ báo cáo tổng hợp.")
            break
            
    total_anomalies = list(predictions).count(-1)
    print("\n=======================================================")
    print(f"   KẾT THÚC GIÁM SÁT. Tổng số mối đe dọa (Anomalies): {total_anomalies}")
    print("=======================================================")

if __name__ == "__main__":
    print("############################################################")
    print("   Bài Tập Thực Hành Tuần 10 - Tự động hóa Bảo mật AI       ")
    print("############################################################\n")
    
    # 1. Thu thập dữ liệu mô phỏng (Data Ingestion)
    network_logs = generate_synthetic_logs(n_samples=3000, n_outliers=150)
    
    # 2. Xây dựng và huấn luyện mô hình (Model Training)
    ai_model = train_isolation_forest(network_logs)
    
    # 3. Kích hoạt giám sát và tự động cảnh báo (Monitoring & Alerting)
    monitor_and_alert(ai_model, network_logs)
    
    print("\n[*] Script thực thi hoàn tất. Hãy kiểm tra các cảnh báo hiển thị bên trên.")
```

### Giải thích Code chi tiết / Detailed Code Explanation

**Tiếng Việt:**
1. **`generate_synthetic_logs`**: Hàm này đóng vai trò như một nguồn cấp dữ liệu log (tương đương với phần mềm Forwarder từ máy chủ thật). Thuộc tính `bytes_transferred` phản ánh lượng dữ liệu, `connection_duration` là thời gian duy trì kết nối TCP, và `login_attempts` bắt các hoạt động xác thực. Bằng cách thiết lập phân phối Gauss (`np.random.normal`) cho dữ liệu sạch và phân phối Uniform (`np.random.uniform`) với giá trị cực lớn cho dữ liệu xấu, ta tạo ra ranh giới tương đối rõ ràng.
2. **`train_isolation_forest`**: Khởi tạo cấu trúc của khu rừng thông qua lớp `IsolationForest`. Tham số quan trọng nhất là `contamination=0.05`. Tham số này nói với mô hình: "Tôi cho rằng có khoảng 5% rác (mã độc) trong mớ dữ liệu này, hãy tìm và khoanh vùng 5% dữ liệu có đặc điểm dị biệt nhất". Nếu thiết lập sai số này (ví dụ 50%), hệ thống sẽ báo động giả liên tục (False Positives).
3. **`monitor_and_alert`**: Đây là bộ máy điều phối (Orchestration logic). Việc gọi `model.predict(df)` sẽ phân loại toàn bộ dữ liệu. Thuật toán quy ước số `-1` dành cho dữ liệu bất thường. Tại điểm có số -1, chúng ta viết code giả lập thực hiện hành động SOAR (in ra màn hình khối block IP). Điều này minh họa cách các nền tảng phân tích bảo mật lớn như Splunk hay QRadar tích hợp script Python nội bộ để tương tác trực tiếp với tường lửa.

**English:**
1. **`generate_synthetic_logs`**: This function acts as a log feed source (equivalent to a log forwarder agent from a real server). The attribute `bytes_transferred` reflects data volume, `connection_duration` is the TCP session time, and `login_attempts` captures authentication events. By setting Gaussian distributions (`np.random.normal`) for clean data and Uniform distributions (`np.random.uniform`) with extreme values for bad data, we create a reasonably clear boundary.
2. **`train_isolation_forest`**: Initializes the structure of the forest via the `IsolationForest` class. The most critical parameter is `contamination=0.05`. This parameter tells the model: "I assume there is about 5% trash (malicious activity) in this dataset, find and isolate the 5% of data with the most anomalous characteristics." If this number is set incorrectly (e.g., 50%), the system will constantly trigger false alarms (False Positives).
3. **`monitor_and_alert`**: This is the orchestration engine (Orchestration logic). Calling `model.predict(df)` classifies the entire dataset. The algorithm uses `-1` by convention for anomalous data. At points where `-1` appears, we write mock code to execute a SOAR action (printing an IP block simulation to the screen). This illustrates how massive security analytics platforms like Splunk or QRadar integrate internal Python scripts to interact directly with firewalls.

---

## Câu Hỏi Thảo Luận / Discussion

### Vietnamese (Tiếng Việt)
1. **Khái niệm cốt lõi:** Tại sao các chuyên gia phân tích bảo mật trong môi trường doanh nghiệp quy mô lớn (Enterprise) lại khao khát các công cụ tự động hóa SOAR? Nếu không có AI hỗ trợ, họ sẽ gặp phải những rủi ro trực tiếp nào về mặt vận hành?
2. **Kỹ thuật & So sánh:** Thuật toán học máy Isolation Forest khác biệt với các phần mềm diệt virus truyền thống hoạt động theo cơ chế so khớp mẫu mã (signature-based) ở điểm mấu chốt nào? Tại sao chữ ký mã độc lại trở nên lỗi thời trước các cuộc tấn công Zero-day?
3. **Hạn chế và Mối đe dọa đối với AI:** "Đầu độc dữ liệu" (Data Poisoning) là gì? Điều gì sẽ xảy ra nếu tin tặc âm thầm làm nhiễu mô hình bằng cách tạo ra các lưu lượng mạng tấn công một cách rất nhỏ giọt, rải rác, lặp lại qua hàng tháng trời để "dạy" mô hình AI coi hành vi xấu đó là điều hiển nhiên (bình thường)?
4. **Đạo đức, Trách nhiệm và Quản trị:** Hãy tưởng tượng hệ thống AI của bạn tự động ra quyết định khóa tài khoản quản trị viên hệ thống nội bộ vì nhầm lẫn hành vi nâng cấp server định kỳ là tấn công phá hoại. Điều gì sẽ xảy ra sau quyết định sai lầm đó (False Positive)? Tầm quan trọng không thể thay thế của yếu tố con người (Human-in-the-loop - HITL) ở đây là gì?
5. **Tổng kết khóa học 10 Tuần:** Nhìn lại hành trình từ những bài đầu tiên, hãy chia sẻ việc kết hợp tư duy phòng thủ an ninh mạng nhiều lớp (Defense in Depth) truyền thống và công nghệ Trí tuệ nhân tạo mang lại lợi ích chiến lược gì cho một tổ chức?

### English
1. **Core Concept:** Why do security analysts in large enterprise environments strongly desire SOAR automation tools? Without AI support, what direct operational risks would they face?
2. **Technical & Comparison:** What is the key difference between the Isolation Forest machine learning algorithm and traditional antivirus software that operates on a pattern matching (signature-based) mechanism? Why do malware signatures become obsolete in the face of Zero-day attacks?
3. **Limitations and Threats to AI:** What is "Data Poisoning"? What happens if attackers stealthily compromise the model by generating attack traffic very slowly and sporadically over months to "teach" the AI model to accept that malicious behavior as the norm?
4. **Ethics, Responsibility, and Governance:** Imagine your AI system automatically decides to lock an internal system administrator's account because it mistakenly identified routine server upgrade behavior as destructive hacking. What are the consequences of that erroneous decision (False Positive)? What is the irreplaceable importance of the human-in-the-loop (HITL) factor here?
5. **10-Week Course Review:** Looking back at the journey from the first lessons, share the strategic benefits an organization gains from combining traditional multi-layered cybersecurity defense concepts (Defense in Depth) with Artificial Intelligence technology?

---

## Bài Về Nhà / Homework

### Vietnamese (Tiếng Việt)

**Nhiệm vụ 1: Nâng cấp Công cụ Giám sát Thực tế (Bắt buộc)**
1. Mở file mã nguồn `soc_ai_monitor.py` mà bạn đã sao chép từ phần thực hành.
2. Thêm một hàm mới có tên `export_alerts_to_csv(df, predictions, filename)`. 
3. Logic của hàm này là: Lọc ra tất cả các dòng dữ liệu bị dự đoán là -1 (Bất thường), sau đó sử dụng tính năng `to_csv()` của Pandas để ghi danh sách các mối đe dọa này ra một tập tin `security_alerts.csv`. Tập tin này phải có đầy đủ các cột thông tin để nộp cho "Giám đốc bảo mật" (Giáo viên).
4. Thử thay đổi tham số `contamination` thành `0.2` (20%) và chạy lại chương trình. Bạn nhận thấy điều gì ở số lượng cảnh báo? Viết nhận xét vào phần chú thích code.

**Nhiệm vụ 2: Trực quan hóa Dữ liệu (Thử thách nâng cao - Điểm cộng)**
1. Sử dụng thư viện `matplotlib.pyplot`.
2. Vẽ một biểu đồ phân tán (Scatter Plot) dưới dạng không gian 2 chiều (2D).
3. Gán trục X là giá trị của `bytes_transferred` và trục Y là `connection_duration`.
4. Hiển thị các chấm dữ liệu bình thường (1) bằng màu **Xanh lá (Green)** và các chấm dữ liệu bất thường (-1) bằng màu **Đỏ (Red)**. 

**Nhiệm vụ 3: Dự án Capstone (Báo cáo cuối khóa)**
Chuẩn bị một báo cáo tổng kết khóa học (dài 3-5 trang). Nội dung bao gồm:
- Tổng hợp kiến thức về cách xây dựng một hệ thống phòng thủ nhiều lớp (Defense in Depth).
- Phân tích vai trò của mật mã học (Cryptography) và AI trong việc bảo vệ dữ liệu.
- Chia sẻ cảm nhận và định hướng phát triển kỹ năng an ninh mạng của bạn trong tương lai.

### English

**Task 1: Upgrade to a Realistic Monitoring Tool (Required)**
1. Open the `soc_ai_monitor.py` source code file you copied from the hands-on section.
2. Add a new function named `export_alerts_to_csv(df, predictions, filename)`.
3. The logic of this function is: Filter out all data rows predicted as -1 (Anomalous), then use Pandas' `to_csv()` feature to write this list of threats to a file named `security_alerts.csv`. This file must contain all information columns to submit to the "CISO" (Teacher).
4. Try changing the `contamination` parameter to `0.2` (20%) and rerun the program. What do you notice about the volume of alerts? Write your observation in code comments.

**Task 2: Data Visualization (Advanced Challenge - Extra Credit)**
1. Utilize the `matplotlib.pyplot` library.
2. Draw a 2D Scatter Plot.
3. Assign the X-axis to the `bytes_transferred` values and the Y-axis to `connection_duration`.
4. Display normal data points (1) in **Green** and anomalous data points (-1) in **Red**.

**Task 3: Capstone Project (Final Report)**
Prepare a course summary report (3-5 pages long). Content should include:
- A synthesis of knowledge on how to build a Defense in Depth system.
- An analysis of the roles of Cryptography and AI in protecting data.
- Sharing your reflections and future directions for developing your cybersecurity skills.

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí (Criteria) | Xuất sắc (9-10) / Excellent | Đạt (7-8) / Good | Cần cải thiện (<7) / Needs Improvement |
| :--- | :--- | :--- | :--- |
| **Hiểu biết Lý thuyết (Theory)** | Giải thích chính xác, sâu sắc về SOC, SOAR và Isolation Forest. Nêu được ví dụ áp dụng vào thực tế môi trường doanh nghiệp. (Clearly and deeply explains SOC, SOAR, and Isolation Forest with enterprise real-world examples). | Nắm được khái niệm cơ bản về các thuật ngữ này nhưng thiếu tính liên kết thực tiễn sâu. (Understands basic concepts but lacks deep practical correlation). | Chưa hiểu rõ sự khác biệt giữa các hệ thống bảo mật tự động hoá AI và các phương pháp kiểm tra thủ công. (Misunderstands the difference between automated AI security and manual checking). |
| **Kỹ năng Lập trình (Coding)** | Code chạy không lỗi. Hàm xuất CSV hoạt động hoàn hảo. Đồ thị phân tán (scatter plot) được vẽ rõ ràng, có chú thích trục tọa độ. (Code runs flawlessly. CSV export works perfectly. Scatter plot is well-drawn with axis labels). | Code chạy được các chức năng cốt lõi, tạo file log thành công nhưng chưa thể vẽ được biểu đồ yêu cầu. (Code runs core functions, CSV log created successfully but failed to plot the chart). | Code có nhiều lỗi cú pháp, thư viện lỗi hoặc không thể thực thi được logic phân loại của AI. (Code has multiple syntax errors, library issues, or fails to execute AI classification logic). |
| **Phân tích Bảo mật (Sec Analysis)**| Phân tích cực kỳ rõ ràng rủi ro do cảnh báo giả (False Positive). Đề xuất được chiến lược tinh chỉnh tham số để cân bằng rủi ro. (Extremely clear analysis of False Positives. Proposes parameter tuning strategies to balance risk). | Có nhận thức cơ bản về cảnh báo giả nhưng chưa biết cách điều chỉnh code để khắc phục. (Aware of false positives but doesn't know how to adjust code to mitigate). | Hoàn toàn bỏ qua vấn đề cảnh báo giả, tin tưởng 100% vào kết quả dự đoán của mô hình học máy. (Completely ignores false positive issues, trusts 100% in ML model predictions). |
| **Báo cáo Capstone (Reporting)** | Báo cáo rõ ràng, cấu trúc mạch lạc. Trình bày thuyết phục kiến trúc Defense in Depth toàn diện 10 tuần. (Report is clear and coherent. Persuasively presents the 10-week comprehensive Defense in Depth architecture). | Báo cáo đầy đủ nội dung theo yêu cầu nhưng văn phong và cấu trúc tổ chức chưa được tối ưu tốt. (Report covers required content but formatting and organization are not optimized). | Báo cáo sơ sài, thiếu mục lục, nộp muộn hạn hoặc hoàn toàn không hoàn thành bài tập cuối khóa. (Report is shallow, lacks TOC, submitted late, or completely missing). |

---

> [!NOTE] 
> **Lưu ý dành cho Giáo viên / Teacher's Note:**
> Tuần 10 là chặng cuối cùng của khóa học 10 tuần. Khuyến khích học viên trình bày sản phẩm code của mình thông qua màn hình máy chiếu trước lớp và tổ chức thảo luận bàn tròn về "Đạo đức AI trong an ninh mạng". 
> Hãy đảm bảo thông điệp cốt lõi được truyền tải: "AI là một công cụ đắc lực để phóng đại khả năng của con người, không phải là một viên đạn bạc để thay thế hoàn toàn tư duy sắc bén của các chuyên gia SOC (Human-in-the-loop)".
> Cuối buổi học, hãy dành 15 phút để vinh danh và trao chứng chỉ hoàn thành khóa học cho các học viên xuất sắc.
> 
> Week 10 is the final leg of the 10-week course. Encourage students to project their code on screen for the class and host a roundtable discussion on "AI Ethics in Cybersecurity."
> Ensure the core message is conveyed: "AI is a powerful tool to amplify human capabilities, not a silver bullet to completely replace the sharp critical thinking of SOC experts (Human-in-the-loop)."
> At the end of the session, dedicate 15 minutes to honor and award certificates of completion to outstanding students.

---
[End of Document]

---

## Phụ Lục Chuyên Sâu (Deep-Dive Appendix): Kiến Trúc Phòng Thủ Chiều Sâu (Defense-In-Depth Architecture)

### 1. Tổng Kết Mô Hình Bảo Mật 10 Tuần (10-Week Security Master Plan)

```text
               🌍 INTERNET / LAN
                      │
           ┌──────────▼──────────┐
           │   Firewall & WAF    │ (Quản lý Cổng & Lọc Traffic)
           └──────────┬──────────┘
                      │
           ┌──────────▼──────────┐
           │ Net Recon (Nmap)    │ (Rà soát dịch vụ & Cổng mở)
           └──────────┬──────────┘
                      │
           ┌──────────▼──────────┐
           │ Wireshark Sniffer   │ (Giám sát gói tin & Phát hiện SYN Flood)
           └──────────┬──────────┘
                      │
           ┌──────────▼──────────┐
           │ App & Data Hashing  │ (Bcrypt / Salt / Secure Coding C++)
           └──────────┬──────────┘
                      │
           ┌──────────▼──────────┐
           │ AI SOC Automation   │ (Isolation Forest / Threat Intel LLM)
           └─────────────────────┘
```

### 2. Bảng Tóm Tắt Kỹ Năng Đã Đạt Được (Skills Matrix)

| Tuần | Chủ đề chính | Kỹ năng kỹ thuật đạt được |
| :--- | :--- | :--- |
| **Week 1-2** | Socket Programming & Scanning | Lập trình Client/Server, TCP Handshake, Port Scanning đa luồng. |
| **Week 3-4** | C++ System & Memory | Con trỏ, Memory Leak, Stack vs Heap, Phòng chống Buffer Overflow. |
| **Week 5-6** | Reconnaissance & Traffic | Sử dụng Nmap trong Kali Linux, Phân tích PCAP bằng Wireshark & Scapy. |
| **Week 7** | Cryptography & Password | Hashing (Bcrypt/Salt/Pepper), WPA2/WPA3 Wi-Fi Security Analysis. |
| **Week 8-9** | AI OSINT & Code Audit | Prompt Engineering cho Threat Intel, Kiểm toán SAST, Log Parsing. |
| **Week 10** | Capstone AI SOC Monitoring | Tự động hóa SOC với Machine Learning (Isolation Forest Anomaly Detection). |
## 20 code minh họa của tuần

- [Mở mục lục code tuần 10](../code/week10/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 10](../code/week10/README.md), học lần lượt từ `01_...` đến `20_...`.
