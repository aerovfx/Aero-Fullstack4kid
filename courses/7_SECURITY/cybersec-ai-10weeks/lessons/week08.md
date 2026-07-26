# Tuần 08: Prompt Engineering cho AI trong OSINT & Đánh giá rủi ro / Week 08: Prompt Engineering for AI in OSINT & Risk Assessment

## Mục Tiêu / Objectives

### Tiếng Việt
- **Hiểu về OSINT (Open Source Intelligence):** Nắm vững các khái niệm cơ bản về trí tuệ nguồn mở, cách thức thu thập và phân tích thông tin công khai một cách hợp pháp và an toàn.
- **Áp dụng Prompt Engineering:** Học cách thiết kế các câu lệnh (prompts) hiệu quả để sử dụng các mô hình ngôn ngữ lớn (LLMs) như OpenAI GPT, Claude, hoặc các mô hình chạy cục bộ (Ollama) trong việc trích xuất, tóm tắt và phân tích dữ liệu OSINT.
- **Tự động hóa Đánh giá Rủi ro:** Xây dựng các quy trình tự động phân tích các nguồn dữ liệu văn bản để phát hiện các mối đe dọa (Threat Intelligence) và đánh giá rủi ro bảo mật (Risk Assessment) cho tổ chức.
- **Thực hành Python:** Sử dụng Python kết hợp với API của các mô hình AI để xử lý ngôn ngữ tự nhiên, phân tích sentiment, và nhận diện các thực thể có thể gây rủi ro (IOCs - Indicators of Compromise) trong các báo cáo bảo mật.
- **Tuân thủ Đạo đức và Pháp lý:** Nhấn mạnh tầm quan trọng của việc chỉ thu thập dữ liệu công khai và tuân thủ nghiêm ngặt các quy định về quyền riêng tư (như GDPR) và luật an ninh mạng. Không bao giờ sử dụng OSINT hoặc AI để nhắm mục tiêu, tấn công hoặc xâm phạm bất kỳ hệ thống, cá nhân hay tổ chức nào.

### English
- **Understand OSINT (Open Source Intelligence):** Grasp the core concepts of open-source intelligence, including how to legally and safely collect and analyze publicly available information.
- **Apply Prompt Engineering:** Learn to craft effective prompts to leverage Large Language Models (LLMs) such as OpenAI GPT, Claude, or local models (via Ollama) for extracting, summarizing, and analyzing OSINT data.
- **Automate Risk Assessment:** Build automated workflows to analyze text-based data sources to detect potential threats (Threat Intelligence) and conduct security risk assessments for organizations.
- **Python Practice:** Utilize Python combined with AI model APIs for Natural Language Processing (NLP), sentiment analysis, and extracting potential risk entities (IOCs - Indicators of Compromise) from security reports.
- **Ethical and Legal Compliance:** Emphasize the critical importance of collecting only publicly available data and strictly adhering to privacy regulations (e.g., GDPR) and cybersecurity laws. Never use OSINT or AI to target, attack, or compromise any system, individual, or organization.

---

## Linh Kiện & Dụng Cụ / Components & Tools

### Phần Cứng / Hardware
- Máy tính cá nhân (PC hoặc Laptop) có kết nối internet ổn định / Personal computer (PC or Laptop) with a stable internet connection.
- (Tùy chọn) Máy tính có GPU nếu muốn chạy các mô hình AI lớn cục bộ mượt mà hơn / (Optional) Computer with GPU for smoother execution of large local AI models.

### Phần Mềm / Software
- Hệ điều hành: Windows, macOS, hoặc Linux / OS: Windows, macOS, or Linux.
- Trình thông dịch Python (phiên bản 3.8 trở lên) / Python interpreter (version 3.8 or higher).
- Trình soạn thảo mã (IDE) như Visual Studio Code, PyCharm, hoặc Jupyter Notebook / Code Editor (IDE) such as Visual Studio Code, PyCharm, or Jupyter Notebook.
- Thư viện Python / Python libraries: `requests`, `beautifulsoup4`, `openai`, `ollama`, `python-dotenv`.
- Công cụ chạy mô hình AI cục bộ (Tùy chọn) / Local AI execution tool (Optional): **Ollama** (https://ollama.com/).
- Trình duyệt web (Chrome, Firefox, Edge, Safari) / Web browser (Chrome, Firefox, Edge, Safari).

### Dữ Liệu & API / Data & APIs
- Khóa API của OpenAI (hoặc bất kỳ nhà cung cấp LLM nào khác mà bạn chọn sử dụng) / API Key for OpenAI (or any other chosen LLM provider).
- (Hoặc) Cài đặt sẵn một mô hình cục bộ qua Ollama, ví dụ: `llama3`, `mistral`, hoặc `phi3` / (Or) A locally installed model via Ollama, e.g., `llama3`, `mistral`, or `phi3`.

---

## Lý Thuyết / Theory

### 1. Giới Thiệu Về OSINT (Open Source Intelligence) / Introduction to OSINT
**Tiếng Việt:**
OSINT là việc thu thập, phân tích và đưa ra quyết định dựa trên các thông tin được công bố công khai. Các nguồn thông tin này có thể bao gồm:
- **Phương tiện truyền thông (Media):** Báo chí, tạp chí, đài phát thanh, truyền hình.
- **Internet:** Mạng xã hội, blog, diễn đàn, trang web chia sẻ video.
- **Dữ liệu chính phủ công khai (Public Government Data):** Báo cáo, ngân sách, hồ sơ tòa án, thông cáo báo chí.
- **Tài liệu học thuật (Academic Publications):** Luận văn, báo cáo nghiên cứu, tài liệu hội thảo.

Trong an ninh mạng phòng thủ (Defensive Cybersecurity), OSINT được sử dụng để:
- **Threat Intelligence:** Thu thập thông tin về các mối đe dọa mới, lỗ hổng bảo mật chưa được vá (zero-days), và các chiến dịch của các nhóm tấn công (APT).
- **Phân tích Rủi ro Bên thứ ba:** Đánh giá tình hình bảo mật của các đối tác, nhà cung cấp dựa trên các thông tin công khai.
- **Phát hiện Rò rỉ Dữ liệu:** Tìm kiếm xem có bất kỳ dữ liệu nhạy cảm nào của tổ chức (như mật khẩu, mã nguồn, tài liệu nội bộ) bị rò rỉ trên internet hay không (ví dụ: trên GitHub, Pastebin, hoặc các diễn đàn).

**English:**
OSINT is the collection, analysis, and decision-making based on publicly available information. These information sources can include:
- **Media:** Newspapers, magazines, radio, television.
- **Internet:** Social networks, blogs, forums, video sharing websites.
- **Public Government Data:** Reports, budgets, court records, press releases.
- **Academic Publications:** Dissertations, research reports, conference papers.

In defensive cybersecurity, OSINT is used for:
- **Threat Intelligence:** Gathering information on new threats, unpatched vulnerabilities (zero-days), and campaigns by attack groups (APTs).
- **Third-Party Risk Analysis:** Assessing the security posture of partners and suppliers based on public information.
- **Data Leak Detection:** Searching to see if any sensitive organizational data (such as passwords, source code, internal documents) has been leaked on the internet (e.g., on GitHub, Pastebin, or forums).

### 2. Tích hợp AI vào OSINT và Đánh giá rủi ro / Integrating AI into OSINT and Risk Assessment
**Tiếng Việt:**
Khối lượng dữ liệu OSINT là khổng lồ và phần lớn là dữ liệu phi cấu trúc (unstructured data) như văn bản thô. AI, đặc biệt là các Mô Hình Ngôn Ngữ Lớn (LLMs), đóng vai trò quan trọng trong việc tự động hóa quá trình xử lý này:
- **Phân loại (Classification):** Xác định loại thông tin (ví dụ: đây là báo cáo về malware, hay là tin tức công nghệ thông thường?).
- **Trích xuất thông tin (Information Extraction):** Rút trích các Chỉ số Thỏa hiệp (Indicators of Compromise - IOCs) như địa chỉ IP độc hại, domain, hash của file, địa chỉ email từ các bài báo hoặc báo cáo bảo mật dài.
- **Tóm tắt (Summarization):** Rút gọn một tài liệu dài hoặc chuỗi bài đăng trên diễn đàn thành một báo cáo tình báo tóm tắt ngắn gọn.
- **Phân tích Cảm xúc và Ý định (Sentiment & Intent Analysis):** Đánh giá mức độ nghiêm trọng hoặc ngữ cảnh của các cuộc thảo luận trực tuyến về một lỗ hổng mới.

**English:**
The volume of OSINT data is massive and mostly unstructured (e.g., raw text). AI, particularly Large Language Models (LLMs), plays a crucial role in automating this processing pipeline:
- **Classification:** Determining the type of information (e.g., is this a report about malware, or just general tech news?).
- **Information Extraction:** Extracting Indicators of Compromise (IOCs) such as malicious IP addresses, domains, file hashes, and email addresses from lengthy articles or security reports.
- **Summarization:** Condensing a long document or a thread of forum posts into a brief intelligence summary report.
- **Sentiment & Intent Analysis:** Assessing the severity or context of online discussions regarding a newly discovered vulnerability.

### 3. Nguyên tắc Cơ bản của Prompt Engineering / Core Principles of Prompt Engineering
**Tiếng Việt:**
Để LLMs hoạt động hiệu quả trong OSINT, chúng ta cần thiết kế Prompt (câu lệnh) tốt. Prompt Engineering không chỉ là "hỏi AI", mà là việc định hình đầu vào để nhận được đầu ra chính xác, định dạng chuẩn và giảm thiểu "ảo giác" (hallucinations).
Các nguyên tắc chính bao gồm:
1.  **Cung cấp Ngữ cảnh rõ ràng (Clear Context):** Gán cho AI một vai trò (ví dụ: "Bạn là một chuyên gia phân tích an ninh mạng cấp cao").
2.  **Định nghĩa Nhiệm vụ cụ thể (Specific Task):** Nêu rõ những gì bạn muốn AI làm (ví dụ: "Hãy trích xuất tất cả các địa chỉ IPv4 từ văn bản sau").
3.  **Quy định Định dạng đầu ra (Output Formatting):** Yêu cầu đầu ra ở định dạng dễ xử lý bằng code (ví dụ: JSON, CSV) để dễ dàng tích hợp vào các hệ thống tự động.
4.  **Cung cấp Ví dụ (Few-Shot Prompting):** Đưa ra một vài ví dụ về đầu vào và đầu ra mong muốn để AI học theo khuôn mẫu.
5.  **Thiết lập Giới hạn (Constraints):** Dặn AI không được suy đoán thông tin, chỉ lấy dữ liệu có trong văn bản được cung cấp.

**English:**
For LLMs to operate effectively in OSINT, we must design good Prompts. Prompt Engineering is not just "asking AI"; it is shaping the input to receive accurate, correctly formatted output while minimizing "hallucinations."
Key principles include:
1.  **Provide Clear Context:** Assign the AI a persona (e.g., "You are a senior cybersecurity analyst").
2.  **Define a Specific Task:** State exactly what you want the AI to do (e.g., "Extract all IPv4 addresses from the following text").
3.  **Specify Output Formatting:** Request the output in a machine-readable format (e.g., JSON, CSV) for easy integration into automated systems.
4.  **Provide Examples (Few-Shot Prompting):** Supply a few examples of desired input and output to guide the AI's response pattern.
5.  **Set Constraints:** Instruct the AI not to guess or invent information; it must only use data present in the provided text.

### 4. Kiến trúc Hệ thống Phân tích OSINT Cơ bản / Basic Architecture of an OSINT Analysis System
**Tiếng Việt:**
Một công cụ tự động hóa OSINT kết hợp AI phòng thủ thường có các bước:
1.  **Thu thập dữ liệu (Data Ingestion):** Dùng web scraping (vd: BeautifulSoup), API (vd: RSS feeds, Twitter/X API, Shodan API) để lấy văn bản thô.
2.  **Tiền xử lý (Preprocessing):** Làm sạch văn bản, loại bỏ thẻ HTML, chuẩn hóa định dạng.
3.  **Xử lý bằng AI (AI Processing):** Gửi văn bản đã làm sạch cùng với Prompt được thiết kế kỹ lưỡng tới API của LLM (OpenAI, Ollama...).
4.  **Hậu xử lý (Post-processing):** Phân tích cú pháp (parse) kết quả trả về (thường là JSON), lưu trữ vào cơ sở dữ liệu (vd: SQLite, MongoDB).
5.  **Cảnh báo và Báo cáo (Alerting & Reporting):** Dựa trên mức độ rủi ro (Risk Score) được AI đánh giá, tạo báo cáo hoặc gửi thông báo.

**English:**
An automated defensive OSINT tool integrating AI typically involves these steps:
1.  **Data Ingestion:** Using web scraping (e.g., BeautifulSoup) or APIs (e.g., RSS feeds, Twitter/X API, Shodan API) to retrieve raw text.
2.  **Preprocessing:** Cleaning the text, removing HTML tags, normalizing formatting.
3.  **AI Processing:** Sending the cleaned text along with a carefully crafted Prompt to an LLM API (OpenAI, Ollama, etc.).
4.  **Post-processing:** Parsing the returned result (usually JSON), and storing it in a database (e.g., SQLite, MongoDB).
5.  **Alerting & Reporting:** Based on the Risk Score assessed by the AI, generating a report or sending notifications.

---

## Sơ Đồ Cấu Hình / Diagram

Sơ đồ sau mô tả quy trình tự động hóa việc thu thập và phân tích các báo cáo bảo mật công cộng (Open Source Security Reports) để nhận diện các mối đe dọa (Threat Intelligence Workflow).

```mermaid
graph TD
    A[Public Security Sources<br>(Blogs, RSS, Advisories)] -->|Web Scraping / API| B(Data Ingestion Module<br>Python: requests, bs4)
    B --> C{Raw Text Data}
    C -->|Preprocessing| D[Text Cleaner]
    D --> E(Prompt Builder<br>Inject Context & Task)
    E -->|API Call| F((Large Language Model<br>Local: Ollama / Cloud: OpenAI))
    F -->|Returns Structured Output<br>JSON Format| G(Result Parser<br>Validate & Extract JSON)
    G --> H{Extracted IOCs &<br>Risk Assessment}
    H -->|Low Risk| I[Log to Database<br>For Future Ref]
    H -->|High Risk| J[Generate Alert<br>Email/Slack Notification]
    
    style A fill:#f9f,stroke:#333,stroke-width:2px
    style F fill:#9ff,stroke:#333,stroke-width:2px
    style J fill:#f96,stroke:#333,stroke-width:2px
```

---

## Thực Hành / Hands-On

**Lưu ý Quan trọng:** Trong các bài thực hành này, chúng ta sẽ phân tích các đoạn văn bản mẫu (mock data) hoặc các báo cáo công khai minh bạch. TUYỆT ĐỐI KHÔNG quét hoặc thu thập dữ liệu từ các trang web cấm scraping (kiểm tra tệp `robots.txt` của trang) và KHÔNG phân tích dữ liệu cá nhân (PII - Personally Identifiable Information).

### Bài Thực Hành 1: Thiết Kế Prompt (Prompt Engineering) Căn Bản
**Mục tiêu:** Tạo một Prompt giúp AI đóng vai trò một nhà phân tích bảo mật để trích xuất IOCs từ một văn bản thô.

**Bước 1: Chuẩn bị văn bản đầu vào (Input Text)**
Chúng ta sẽ dùng một đoạn trích giả định từ một báo cáo bảo mật:
> "Vào ngày 15/08/2026, đội phản ứng sự cố đã phát hiện một chiến dịch lừa đảo (phishing) nhắm vào nhân viên nội bộ. Kẻ tấn công đã sử dụng địa chỉ email 'admin-update@secure-login-portal.net' để gửi các liên kết độc hại. Nếu nạn nhân nhấp vào liên kết, họ sẽ tải xuống một tệp tin có tên 'Update_Patch_v2.exe' với mã băm SHA256 là 9b88c7a... Một số kết nối mạng đã được ghi nhận trỏ về địa chỉ IP 192.168.1.100 (lưu ý: đây là IP nội bộ giả định) và một máy chủ từ xa tại 45.33.32.156."

**Bước 2: Xây dựng Prompt (System Prompt & User Prompt)**
Một Prompt tốt nên tách biệt vai trò (System) và yêu cầu cụ thể (User).

- **System Prompt (Vai trò & Luật):**
  "Bạn là một chuyên gia phân tích an ninh mạng (Cybersecurity Threat Analyst). Nhiệm vụ của bạn là đọc các báo cáo sự cố và trích xuất các Chỉ số Thỏa hiệp (Indicators of Compromise - IOCs) quan trọng. Bạn phải tuân thủ nghiêm ngặt định dạng đầu ra là JSON. Không thêm bất kỳ văn bản giải thích nào ngoài cấu trúc JSON. Nếu không tìm thấy thông tin cho một trường, hãy để giá trị là chuỗi rỗng hoặc mảng rỗng."

- **User Prompt (Nhiệm vụ & Định dạng):**
  "Hãy phân tích đoạn văn bản sau và trích xuất thông tin theo cấu trúc JSON định sẵn. Các trường cần thiết: 'email_addresses' (mảng), 'file_names' (mảng), 'hashes' (mảng), 'ip_addresses' (mảng), 'attack_type' (chuỗi, dự đoán loại tấn công dựa trên ngữ cảnh).
  Văn bản: [Chèn đoạn văn bản giả định ở trên vào đây]"

### Bài Thực Hành 2: Sử dụng Python và OpenAI API để Phân tích Tự động
**Mục tiêu:** Viết một script Python thực thi Prompt trên bằng cách gọi API của OpenAI (hoặc một nhà cung cấp tương đương tương thích với thư viện OpenAI).

**Bước 1: Cài đặt thư viện**
```bash
pip install openai python-dotenv pydantic
```

**Bước 2: Tạo tệp `.env`**
Tạo một tệp có tên `.env` trong cùng thư mục với script Python của bạn và thêm khóa API của bạn vào đó:
```env
OPENAI_API_KEY=sk-your-api-key-here
```
*(Nếu bạn dùng mô hình nội bộ hoặc giả lập OpenAI API, có thể thay đổi `BASE_URL` trong code).*

**Bước 3: Viết Script (Xem phần Code Mẫu - Script 1)**

### Bài Thực Hành 3: Sử Dụng Mô Hình Ngôn Ngữ Cục Bộ (Ollama) Vì Tính Bảo Mật Dữ Liệu
**Mục tiêu:** Trong môi trường bảo mật thực tế, việc gửi dữ liệu nhạy cảm ra ngoài qua các API đám mây (như OpenAI) có thể vi phạm chính sách bảo mật (Data Privacy & Compliance). Chúng ta sẽ học cách phân tích dữ liệu bảo mật bằng một mô hình chạy hoàn toàn trên máy tính cá nhân bằng công cụ Ollama.

**Bước 1: Cài đặt và khởi chạy Ollama**
- Tải Ollama từ https://ollama.com/
- Mở terminal/command prompt và chạy lệnh để tải một mô hình nhẹ nhưng mạnh mẽ cho NLP (ví dụ: llama3 hoặc mistral):
```bash
ollama run llama3
```
*(Lần chạy đầu tiên sẽ tốn thời gian tải mô hình về máy).*
- Khi mô hình đã sẵn sàng, bạn có thể gõ `/bye` để thoát khỏi giao diện dòng lệnh. Ollama sẽ tự động chạy ngầm trên máy bạn (thường ở địa chỉ `http://localhost:11434`).

**Bước 2: Cài đặt thư viện Python cho Ollama**
```bash
pip install ollama
```

**Bước 3: Viết Script (Xem phần Code Mẫu - Script 2)**

---

## Code Mẫu / Code Samples

### Script 1: Trích Xuất Phân Tích Mối Đe Dọa Tự Động Với OpenAI / Automated Threat Intelligence Extraction using OpenAI API (Python)

Lưu ý: Bạn cần có `OPENAI_API_KEY` hợp lệ trong file `.env`. Trong ví dụ này, chúng ta kết hợp thư viện `pydantic` với tính năng `Structured Outputs` (nếu dùng model gpt-4o-mini hoặc gpt-4o) hoặc Prompt tiêu chuẩn để ép kiểu JSON. Ở đây, ta dùng cách Prompting truyền thống để ép đầu ra JSON nhằm tính tương thích cao.

```python
# File: week08_openai_osint.py
import os
import json
from openai import OpenAI
from dotenv import load_dotenv

# Tải biến môi trường từ file .env / Load environment variables
load_dotenv()

# Khởi tạo client / Initialize client
# Đảm bảo bạn đã đặt OPENAI_API_KEY trong file .env của mình
api_key = os.getenv("OPENAI_API_KEY")
if not api_key:
    print("[Error] Vui lòng thiết lập OPENAI_API_KEY trong file .env")
    exit(1)

client = OpenAI(api_key=api_key)

def analyze_security_report(report_text: str) -> dict:
    """
    Phân tích một báo cáo bảo mật và trả về JSON chứa các IOCs.
    Analyzes a security report and returns JSON containing IOCs.
    """
    system_prompt = (
        "Bạn là một chuyên gia phân tích an ninh mạng (Cybersecurity Threat Analyst). "
        "Nhiệm vụ của bạn là đọc các báo cáo sự cố và trích xuất các Chỉ số Thỏa hiệp (IOCs). "
        "Bạn PHẢI trả về kết quả định dạng JSON thuần túy, không sử dụng Markdown formatting (như ```json) "
        "hay bất kỳ văn bản giải thích nào khác. "
        "Cấu trúc JSON yêu cầu: "
        "{ "
        "  \"incident_summary\": \"Tóm tắt sự cố (chuỗi ngắn)\", "
        "  \"attack_type\": \"Loại hình tấn công (ví dụ: Phishing, Ransomware)\", "
        "  \"iocs\": { "
        "    \"ipv4_addresses\": [], "
        "    \"domains\": [], "
        "    \"emails\": [], "
        "    \"file_hashes\": [], "
        "    \"file_names\": [] "
        "  }, "
        "  \"risk_level\": \"Đánh giá rủi ro (Low, Medium, High, Critical)\" "
        "}"
    )

    user_prompt = f"Hãy trích xuất thông tin từ báo cáo bảo mật sau:\n\n{report_text}"

    print("[Info] Đang gửi yêu cầu tới mô hình AI để phân tích... / Sending request to AI model...")
    try:
        response = client.chat.completions.create(
            model="gpt-3.5-turbo", # Hoặc "gpt-4o-mini" nếu tài khoản hỗ trợ
            messages=[
                {"role": "system", "content": system_prompt},
                {"role": "user", "content": user_prompt}
            ],
            temperature=0.0 # Để giảm thiểu ảo giác, giữ tính xác định
        )
        
        result_text = response.choices[0].message.content
        
        # Làm sạch chuỗi trả về trong trường hợp AI vẫn in kèm thẻ markdown (```json ... ```)
        result_text = result_text.replace("```json", "").replace("```", "").strip()
        
        # Parse JSON
        parsed_data = json.loads(result_text)
        return parsed_data

    except json.JSONDecodeError as e:
        print(f"[Error] Không thể phân tích cú pháp JSON từ phản hồi của AI. Chi tiết lỗi: {e}")
        print(f"Phản hồi thô: {result_text}")
        return None
    except Exception as e:
        print(f"[Error] Đã xảy ra lỗi khi gọi API: {e}")
        return None

if __name__ == "__main__":
    # Dữ liệu OSINT giả định (Mock OSINT Data)
    mock_osint_report = (
        "CẢNH BÁO BẢO MẬT: Nhóm phản ứng sự cố của chúng tôi đã phát hiện một chiến dịch "
        "tấn công Ransomware mới đang nhắm vào các doanh nghiệp nhỏ. Kẻ tấn công đã phát tán "
        "mã độc thông qua các email lừa đảo mạo danh nhà cung cấp hóa đơn, được gửi từ địa chỉ "
        "'billing@secure-payment-gateway-update.com'. Nếu nạn nhân tải xuống đính kèm 'invoice_092026.doc', "
        "một tập lệnh vba sẽ được thực thi và tải về payload chính từ domain 'malicious-server-payload.net'. "
        "Mã băm SHA-256 của file payload (invoice_092026.exe) là a1b2c3d4e5f67890abcdef1234567890. "
        "Giao tiếp C2 (Command and Control) được quan sát thấy đang kết nối tới IP 185.12.34.56 và 8.8.4.4. "
        "Yêu cầu mọi người chặn ngay lập tức các IP và domain này."
    )

    print("=== DỮ LIỆU ĐẦU VÀO (RAW TEXT) ===")
    print(mock_osint_report)
    print("==================================\n")

    analysis_result = analyze_security_report(mock_osint_report)

    if analysis_result:
        print("=== KẾT QUẢ PHÂN TÍCH (EXTRACTED IOCs & ASSESSMENT) ===")
        print(json.dumps(analysis_result, indent=4, ensure_ascii=False))
        print("=======================================================")
```

### Script 2: Phân Tích Rủi Ro Riêng Tư Với Ollama / Privacy-Preserving Risk Assessment using Local Ollama (Python)

Kịch bản này sử dụng thư viện `ollama` để tương tác với mô hình chạy ngay trên máy tính của bạn, đảm bảo không có dữ liệu nhạy cảm nào bị gửi ra internet.

```python
# File: week08_local_ollama_osint.py
import json
import ollama

def extract_intel_local(report_text: str, model_name: str = "llama3") -> dict:
    """
    Sử dụng Ollama (chạy local) để phân tích báo cáo bảo mật.
    Uses Local Ollama to analyze a security report.
    """
    system_prompt = (
        "You are an expert Threat Intelligence System. Your task is to extract Indicators of Compromise (IOCs) "
        "from the provided text. You MUST output ONLY valid JSON format. Do not include any explanations, greetings, "
        "or markdown formatting tags like ```json. Just raw JSON data.\n"
        "Required JSON schema:\n"
        "{\n"
        "  \"threat_type\": \"string (e.g., malware, phishing)\",\n"
        "  \"indicators\": {\n"
        "    \"ips\": [\"array of strings\"],\n"
        "    \"domains\": [\"array of strings\"],\n"
        "    \"hashes\": [\"array of strings\"]\n"
        "  },\n"
        "  \"severity\": \"string (Critical, High, Medium, Low)\"\n"
        "}"
    )

    user_prompt = f"Extract intelligence from this report:\n\n{report_text}"

    print(f"[Info] Đang xử lý cục bộ bằng mô hình '{model_name}' qua Ollama... / Processing locally with '{model_name}'...")
    try:
        response = ollama.chat(model=model_name, messages=[
            {
                'role': 'system',
                'content': system_prompt,
            },
            {
                'role': 'user',
                'content': user_prompt,
            }
        ])
        
        result_text = response['message']['content'].strip()
        
        # Làm sạch chuỗi nếu cần
        if result_text.startswith("```json"):
            result_text = result_text[7:]
        if result_text.endswith("```"):
            result_text = result_text[:-3]
            
        result_text = result_text.strip()
        
        parsed_data = json.loads(result_text)
        return parsed_data

    except json.JSONDecodeError as e:
        print(f"[Error] Không thể parse JSON từ Ollama. (Model cục bộ đôi khi không tuân thủ nghiêm ngặt prompt).")
        print(f"Chi tiết: {e}")
        print(f"Kết quả thô:\n{result_text}")
        return None
    except Exception as e:
        print(f"[Error] Đã xảy ra lỗi khi gọi Ollama: {e}")
        print("[Hint] Hãy chắc chắn rằng bạn đã chạy ứng dụng Ollama và đã tải mô hình (ví dụ: `ollama run llama3`)")
        return None

if __name__ == "__main__":
    # Dữ liệu OSINT giả định
    mock_text = (
        "Phân tích hệ thống phát hiện có sự liên lạc bất thường từ máy trạm đến địa chỉ IP 104.21.5.112. "
        "Gói tin chứa chuỗi liên quan đến mã độc Trojan. Đồng thời, máy trạm đã cố phân giải tên miền "
        "'suspicious-update-server.org'. Cần tiến hành cách ly ngay lập tức."
    )
    
    print("Văn bản nguồn:")
    print(mock_text)
    print("\n--- Bắt đầu phân tích (Ollama) ---\n")
    
    # Bạn có thể thay đổi model_name thành "mistral" hoặc "phi3" tùy thuộc vào model bạn đã tải
    result = extract_intel_local(mock_text, model_name="llama3")
    
    if result:
        print("Kết quả JSON:")
        print(json.dumps(result, indent=2))

```

---

## Câu Hỏi Thảo Luận / Discussion

1.  **Tiếng Việt:** Tại sao việc ép kiểu đầu ra của LLM thành JSON (JSON Structured Output) lại quan trọng trong các công cụ phân tích an ninh mạng tự động? Điều gì sẽ xảy ra nếu đầu ra không đồng nhất?
    **English:** Why is enforcing JSON structured output from LLMs important in automated cybersecurity analysis tools? What happens if the output is inconsistent?
2.  **Tiếng Việt:** Sự khác biệt về rủi ro quyền riêng tư (Privacy Risks) giữa việc sử dụng Cloud AI API (như OpenAI) và Local AI (như Ollama) khi xử lý các bản ghi lỗi mạng (network logs) thực tế của một công ty là gì?
    **English:** What are the differences in Privacy Risks between using Cloud AI APIs (like OpenAI) and Local AI (like Ollama) when processing actual company network logs?
3.  **Tiếng Việt:** "Ảo giác" (Hallucination) của AI là hiện tượng mô hình bịa đặt thông tin. Trong quy trình Threat Intelligence, điều này có thể gây ra hậu quả xấu như thế nào? Làm sao để Prompt Engineering giúp giảm thiểu rủi ro này?
    **English:** AI "Hallucination" is the phenomenon where the model invents information. In the Threat Intelligence pipeline, what negative consequences can this cause? How does Prompt Engineering help mitigate this risk?

---

## Bài Về Nhà / Homework

**Nhiệm Vụ (Task): Xây Dựng Máy Cạo Tin Tức Bảo Mật (Security News Scraper & Analyzer)**

1.  **Viết Script Thu Thập (Scraper):** Viết một script Python đơn giản (sử dụng thư viện `requests` và `beautifulsoup4` hoặc thư viện feed parser `feedparser`) để lấy tiêu đề và đoạn tóm tắt từ một nguồn tin tức bảo mật công khai qua định dạng RSS.
    *Gợi ý nguồn RSS:* `https://feeds.feedburner.com/TheHackersNews` hoặc `https://www.bleepingcomputer.com/feed/`
2.  **Tích hợp AI (AI Integration):** Đưa khoảng 3 đến 5 đoạn tóm tắt tin tức (news summaries) vừa thu thập được vào script API (OpenAI hoặc Ollama) đã học ở phần thực hành.
3.  **Prompt Tùy chỉnh (Custom Prompt):** Tùy chỉnh System Prompt để yêu cầu AI đánh giá xem tin tức đó có chứa thông tin về "Zero-Day Vulnerability" (Lỗ hổng chưa được vá) hay không. Đầu ra JSON cần có dạng:
    ```json
    [
      {
        "title": "Tên bài báo",
        "is_zero_day_related": true/false,
        "summary": "Tóm tắt 1 câu tiếng Việt"
      }
    ]
    ```
4.  **Báo cáo (Report):** Lưu kết quả JSON cuối cùng vào một tệp tin có tên `weekly_threat_report.json`.

**Yêu cầu nộp bài:** Nộp file mã nguồn Python (vd: `hw08_osint_analyzer.py`) và tệp kết quả `weekly_threat_report.json`.

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí / Criteria | Xuất Sắc / Excellent (9-10) | Khá / Good (7-8) | Cơ Bản / Basic (5-6) | Cần Cải Thiện / Needs Improvement (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Hiểu biết OSINT & AI** <br> *(Knowledge of OSINT & AI)* | Giải thích sâu sắc sự khác biệt giữa xử lý văn bản truyền thống và sử dụng AI trong OSINT. Hiểu rõ ưu/nhược điểm của Local vs Cloud LLMs. | Hiểu các khái niệm cơ bản về OSINT và cách AI có thể tự động hóa việc trích xuất IOCs. | Biết OSINT là gì nhưng chưa kết nối rõ ràng được vai trò của AI trong tự động hóa. | Còn nhầm lẫn về khái niệm OSINT hoặc không hiểu mục đích sử dụng AI. |
| **Kỹ năng Prompt Engineering** <br> *(Prompt Engineering Skills)* | Thiết kế Prompt rất chặt chẽ (Context, Task, Format, Constraints). Tránh được hoàn toàn ảo giác. Kết quả JSON luôn chuẩn xác. | Thiết kế Prompt đáp ứng đủ yêu cầu, thỉnh thoảng (hiếm khi) bị lệch định dạng. Có áp dụng phân vai (System Prompt). | Prompt còn sơ sài, giống như đang chat thông thường với AI. Phải xử lý chuỗi nhiều để lấy được JSON. | Không sử dụng System Prompt. Không yêu cầu được định dạng JSON hoặc kết quả AI trả về toàn là văn bản tự do. |
| **Thực hành Code (Python)** <br> *(Coding Practice)* | Code sạch, cấu trúc tốt, có xử lý lỗi `try-except` (đặc biệt khi parse JSON). Sử dụng linh hoạt cả OpenAI API và Ollama. | Hoàn thành được script chạy ổn định với một trong hai phương pháp. Code dễ đọc, có comment giải thích. | Script chạy được nhưng còn lỗi lặt vặt hoặc copy code không chỉnh sửa. Thiếu bình luận (comments) code. | Code không chạy được (Syntax error) hoặc không kết nối được với API/Mô hình do thiếu cấu hình. |
| **Tuân thủ Đạo đức / Bảo mật** <br> *(Ethics & Security Compliance)* | Tuân thủ tuyệt đối quy tắc đạo đức: Chỉ quét dữ liệu công khai (có kiểm tra RSS/robots.txt), dùng Local AI cho dữ liệu giả định nhạy cảm. | Có ý thức về đạo đức OSINT, hiểu rằng không được cào dữ liệu từ các trang cấm, nhưng chưa thực hiện mã hóa an toàn các API Key. | Biết về rủi ro nhưng vẫn hard-code API Key trong source code nộp bài. | Vi phạm luật (ví dụ: viết code tấn công thay vì phân tích phòng thủ) - ĐIỂM 0. |

---
*Tài liệu nội bộ khóa học Aero-Fullstack4kid - Cybersecurity & AI. Vui lòng không sao chép khi chưa được phép.*
