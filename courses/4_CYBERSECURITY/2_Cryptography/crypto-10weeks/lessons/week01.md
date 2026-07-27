# Tuần 1: Mật Mã Cổ Điển & Phân Tích Tần Suất / Week 1: Classical Cryptography & Frequency Analysis

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Nắm vững lịch sử phát triển của Mật mã học từ thời cổ đại đến hiện đại.
- Hiểu rõ nguyên lý hoạt động của các hệ mật mã thay thế (Substitution Ciphers) như Caesar, Monoalphabetic, và Vigenère.
- Nắm vững **Nguyên tắc Kerckhoffs** (Kerckhoffs's Principle): Độ an toàn của hệ mật dựa vào sự bí mật của Khóa (Key), không dựa vào sự bí mật của Thuật toán (Algorithm).
- Thực hành lập trình Python mã hóa và giải mã chuỗi văn bản sử dụng Caesar Cipher và Vigenère Cipher.
- Áp dụng phương pháp **Phân tích tần suất (Frequency Analysis)** để bẻ khóa mật mã cổ điển mà không cần biết trước khóa.

### English
- Master the historical development of Cryptography from ancient to modern times.
- Understand the core principles of Substitution Ciphers such as Caesar, Monoalphabetic, and Vigenère ciphers.
- Grasp **Kerckhoffs's Principle**: System security must rely solely on the secrecy of the Key, not the secrecy of the Algorithm.
- Practice Python programming to encrypt and decrypt text messages using Caesar Cipher and Vigenère Cipher.
- Apply **Frequency Analysis** techniques to break classical ciphers without prior knowledge of the key.

---

## Linh Kiện & Dụng Cụ / Components & Tools

### Tiếng Việt (Vietnamese)
- Máy tính cá nhân (Windows, macOS hoặc Linux).
- Môi trường Python 3.10+ đã được cài đặt.
- Trình soạn thảo mã nguồn: VS Code hoặc PyCharm.
- Bảng tần suất chữ cái Tiếng Anh và Tiếng Việt chuẩn.

### English
- Personal Computer (Windows, macOS, or Linux).
- Installed Python 3.10+ environment.
- Code Editor: VS Code or PyCharm.
- Standard English & Vietnamese letter frequency tables.

---

## Lý Thuyết / Theory

### 1. Giới thiệu về Mật Mã Học & Nguyên tắc Kerckhoffs / Introduction & Kerckhoffs's Principle

#### Tiếng Việt
**Mật mã học (Cryptography)** là khoa học nghiên cứu các kỹ thuật biến đổi thông tin từ dạng rõ (Plaintext) thành dạng mã hóa (Ciphertext) nhằm đảm bảo tính bảo mật, toàn vẹn và xác thực của dữ liệu.

Một hệ thống mật mã tiêu chuẩn bao gồm:
- **Plaintext ($P$):** Thông điệp gốc ban đầu.
- **Ciphertext ($C$):** Thông điệp đã được mã hóa.
- **Encryption Function ($E$):** Hàm mã hóa $C = E_k(P)$.
- **Decryption Function ($D$):** Hàm giải mã $P = D_k(C)$.
- **Key ($k$):** Khóa bí mật dùng để mã hóa và giải mã.

> [!IMPORTANT]
> **Nguyên tắc Kerckhoffs (Kerckhoffs's Principle - 1883):**
> "Một hệ thống mật mã phải an toàn ngay cả khi mọi chi tiết về thuật toán đều được công khai cho đối phương, ngoại trừ KHÓA BÍ MẬT."
> Việc cố tình giấu thuật toán (Security through obscurity) là một sai lầm nghiêm trọng trong thiết kế an ninh thông tin.

#### English
**Cryptography** is the science of transforming information from readable plaintext into an unreadable ciphertext to guarantee confidentiality, integrity, and authenticity.

A standard cryptosystem consists of:
- **Plaintext ($P$):** The original unencrypted message.
- **Ciphertext ($C$):** The encrypted message.
- **Encryption Function ($E$):** $C = E_k(P)$.
- **Decryption Function ($D$):** $P = D_k(C)$.
- **Key ($k$):** Secret key used for encryption and decryption.

> [!IMPORTANT]
> **Kerckhoffs's Principle (1883):**
> "A cryptosystem should be secure, even if everything about the system, except the key, is public knowledge."
> Relying on "Security through obscurity" is a fundamental flaw in security design.

---

### 2. Mật Mã Thay Thế Caesar (Caesar Cipher)

#### Tiếng Việt
Mật mã Caesar là một trong những kỹ thuật mã hóa đơn giản nhất. Mỗi ký tự trong văn bản rõ được dịch chuyển một số vị trí cố định $k$ trong bảng chữ cái.

**Công thức toán học:**
$$\text{Mã hóa: } C_i = (P_i + k) \pmod{26}$$
$$\text{Giải mã: } P_i = (C_i - k) \pmod{26}$$

Trong đó $k \in \{0, 1, 2, \dots, 25\}$ là dịch chuyển (Key). Vì không gian khóa chỉ có 26 trường hợp, mật mã Caesar cực kỳ dễ bị tấn công vét cạn (Brute-force attack).

#### English
The Caesar Cipher is one of the simplest encryption techniques. Each letter in the plaintext is shifted by a fixed number of positions $k$ down the alphabet.

**Mathematical Formulas:**
$$\text{Encryption: } C_i = (P_i + k) \pmod{26}$$
$$\text{Decryption: } P_i = (C_i - k) \pmod{26}$$

Where $k \in \{0, 1, 2, \dots, 25\}$ is the shift key. Because the key space is only 26, Caesar cipher is trivially broken by Brute-force.

---

### 3. Mật Mã Vigenère & Phân Tích Tần Suất / Vigenère Cipher & Frequency Analysis

#### Tiếng Việt
**Mật mã Vigenère** là hệ mật thay thế đa bảng chữ cái (Polyalphabetic Substitution Cipher), sử dụng một từ khóa (Keyword) lặp đi lặp lại để thay đổi độ dịch chuyển $k$ cho từng ký tự.

**Công thức Vigenère:**
$$C_i = (P_i + K_{i \bmod m}) \pmod{26}$$

**Kỹ thuật Phân Tích Tần Suất (Frequency Analysis):**
Trong ngôn ngữ tự nhiên (như Tiếng Anh), các chữ cái xuất hiện với tần suất không đồng đều. Ký tự `'E'` xuất hiện nhiều nhất (~12.7%), tiếp theo là `'T'` (~9.1%), `'A'` (~8.2%).
Mặc dù mật mã Vigenère làm phẳng biểu đồ tần suất, nhưng bằng phương pháp Kasiski hoặc chỉ số trùng khớp (Index of Coincidence - IC), thám mã viên có thể đoán độ dài từ khóa và phá mã thành công.

#### English
**Vigenère Cipher** is a polyalphabetic substitution cipher that uses a repeating keyword to vary the shift $k$ for each character.

**Vigenère Formula:**
$$C_i = (P_i + K_{i \bmod m}) \pmod{26}$$

**Frequency Analysis:**
In natural languages (like English), letters appear with non-uniform frequencies. `'E'` is most frequent (~12.7%), followed by `'T'` (~9.1%), `'A'` (~8.2%).
Although Vigenère flattens the frequency distribution, methods like Kasiski examination or Index of Coincidence (IC) can determine keyword length and break the cipher.

---

## Code Mẫu Thực Hành / Code Implementations

### Code 1: Caesar Cipher Encryption & Decryption in Python
```python
def caesar_encrypt(plaintext: str, key: int) -> str:
    ciphertext = []
    for char in plaintext:
        if char.isalpha():
            base = ord('A') if char.isupper() else ord('a')
            shifted = (ord(char) - base + key) % 26 + base
            ciphertext.append(chr(shifted))
        else:
            ciphertext.append(char)
    return "".join(ciphertext)

def caesar_decrypt(ciphertext: str, key: int) -> str:
    return caesar_encrypt(ciphertext, -key)

# Test
if __name__ == "__main__":
    msg = "HELLO CRYPTOGRAPHY WORLD!"
    k = 3
    encrypted = caesar_encrypt(msg, k)
    decrypted = caesar_decrypt(encrypted, k)
    print(f"Plaintext : {msg}")
    print(f"Encrypted : {encrypted}")
    print(f"Decrypted : {decrypted}")
```

---

### Code 2: Vigenère Cipher in Python
```python
def vigenere_encrypt(plaintext: str, key: str) -> str:
    ciphertext = []
    key_upper = key.upper()
    key_length = len(key_upper)
    key_index = 0

    for char in plaintext:
        if char.isalpha():
            base = ord('A') if char.isupper() else ord('a')
            shift = ord(key_upper[key_index % key_length]) - ord('A')
            encrypted_char = chr((ord(char) - base + shift) % 26 + base)
            ciphertext.append(encrypted_char)
            key_index += 1
        else:
            ciphertext.append(char)
    return "".join(ciphertext)

# Test
if __name__ == "__main__":
    text = "DEFEND THE EAST WALL OF THE CASTLE"
    keyword = "FORTIFICATION"
    cipher = vigenere_encrypt(text, keyword)
    print(f"Original  : {text}")
    print(f"Vigenere  : {cipher}")
```

---

## Câu Hỏi Thảo Luận / Discussion Questions

1. Tại sao "Security through obscurity" (Giấu thuật toán) lại là một sai lầm trong an ninh thông tin hiện đại?
2. Nếu không gian khóa của Caesar Cipher chỉ có 26 trường hợp, bạn sẽ mất bao lâu để bẻ khóa một đoạn mã bằng máy tính?
3. Tại sao mật mã Vigenère từng được gọi là "le chiffre indéchiffrable" (mật mã không thể bị phá) trong nhiều thế kỷ?
4. Chỉ số trùng khớp (Index of Coincidence - IC) giúp thám mã viên tìm ra độ dài từ khóa Vigenère như thế nào?
5. Sự khác biệt cơ bản giữa hệ mật thay thế (Substitution) và hệ mật hoán vị (Transposition) là gì?

---

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 1.1: Trình Tự Động Phá Mã Caesar Bằng Từ Điển (Dictionary-based Caesar Solver)
Viết script Python `caesar_solver.py` tự động thử 26 khóa từ $k = 0$ đến $25$. Script tự động đếm số lượng từ tiếng Anh thông dụng (như `"THE"`, `"AND"`, `"IN"`, `"IS"`, `"YOU"`, `"THAT"`) trong văn bản giải mã và tự xuất ra kết quả có điểm số cao nhất.

- **Đầu vào (Input):** `Ciphertext = "KHOOR ZRUOG! WKLV LV D VHFUHW PHVVDJH."`
- **Đầu ra kỳ vọng (Expected Output):**
  ```text
  [+] Detected Best Key: 3 (Match Score: 5)
  [+] Decrypted Plaintext: "HELLO WORLD! THIS IS A SECRET MESSAGE."
  ```

#### Bài 1.2: Cài Đặt Trình Giải Mã Vigenère (Vigenère Decryptor)
Viết hàm Python `vigenere_decrypt(ciphertext: str, key: str) -> str` giải mã chuẩn xác các ký tự chữ hoa, chữ thường và giữ nguyên các dấu câu, khoảng trắng.

- **Đầu vào (Input):** `Ciphertext = "ISWZXE XJS RNWY TIQQ TR XJS HFXYQJ"`, `Key = "FORTIFICATION"`
- **Đầu ra kỳ vọng (Expected Output):** `Plaintext = "DEFEND THE EAST WALL OF THE CASTLE"`

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 1.3: Phân Tích Độ Dài Từ Khóa Vigenère Bằng Chỉ Số Trùng Khớp (Index of Coincidence - IC)
Viết script Python `vigenere_ic_analyzer.py` tính chỉ số $IC$ cho văn bản mã hóa để đoán độ dài từ khóa $m \in \{1, 2, \dots, 10\}$.

**Công thức Chỉ số Trùng Khớp $IC$:**
$$IC = \frac{\sum_{i=A}^{Z} f_i (f_i - 1)}{N(N - 1)}$$
*Trong đó $f_i$ là số lần xuất hiện của chữ cái $i$, $N$ là tổng số chữ cái.*
- Nếu $IC \approx 0.066$: Văn bản là Tiếng Anh đơn bảng (Caesar / Monoalphabetic).
- Nếu $IC \approx 0.038$: Văn bản mã hóa đa bảng ngẫu nhiên.

---

### 🔴 Phần C: Thực Hành Colab / Mini Project (Hands-on Colab Lab)

#### Bài 1.4: Xây Dựng Trình Trực Quan Hóa Tần Suất Ký Tự (Colab Visualizer)
Mở Google Colab notebook và thực hiện các bước sau:
1. Nhập một đoạn văn bản tiếng Anh dài 500 từ.
2. Mã hóa đoạn văn bản bằng thuật toán Caesar với khóa ngẫu nhiên $k$.
3. Vẽ biểu đồ cột (Bar Chart) so sánh tần suất xuất hiện của 26 chữ cái giữa Plaintext và Ciphertext bằng thư viện `matplotlib`.
4. Viết nhận xét về sự dịch chuyển của đỉnh biểu đồ (ví dụ: đỉnh cao nhất `'E'` dịch chuyển sang chữ cái nào).

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Phân Tích Thuật Toán** | Giải thích sâu sắc nguyên lý Kerckhoffs, công thức Modulo 26 và chỉ số IC. | Giải thích đúng thuật toán Caesar, Vigenère và phân tích tần suất cơ bản. | Hiểu cách dịch chuyển ký tự nhưng chưa giải thích được phân tích tần suất. | Nhầm lẫn giữa mã hóa và giải mã. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành cả 4 bài (tự động phá mã Caesar, Vigenère decryptor, IC analyzer & Colab chart). | Hoàn thành Bài 1.1 và Bài 1.2 đúng yêu cầu. | Code có lỗi xử lý chữ thường hoặc chưa tự động chấm điểm từ điển. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - Cryptography 10 Weeks)*
