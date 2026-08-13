# Tuần 4: Đa luồng trong C++ & Phòng chống Tràn bộ đệm / Week 4: Multi-threading in C++ & Buffer Overflow Prevention

## Mục Tiêu / Objectives

### Vietnamese
Trong tuần này, học sinh sẽ học cách thiết kế và quản lý các ứng dụng đa luồng (multi-threading) sử dụng ngôn ngữ lập trình C++. Chúng ta sẽ khám phá sự khác biệt giữa đồng thời (concurrency) và song song (parallelism), cách đồng bộ hóa dữ liệu giữa các luồng để tránh tình trạng tương tranh (race conditions) và bế tắc (deadlocks). Ngoài ra, một phần rất quan trọng của bài học là hiểu về tổ chức bộ nhớ trong C++ (Stack và Heap) và khái niệm về lỗi tràn bộ đệm (Buffer Overflow). Sinh viên sẽ học cách phòng ngừa lỗi này bằng các phương pháp lập trình phòng thủ (defensive programming).

**Mục tiêu cụ thể bao gồm:**
1. Hiểu và áp dụng thư viện `<thread>` trong chuẩn C++11 trở lên.
2. Nắm vững khái niệm cơ bản về Mutex, Lock, và các cơ chế đồng bộ hóa.
3. Hiểu rõ kiến trúc bộ nhớ: Code, Data, Heap, và Stack.
4. Nắm bắt được nguyên lý cơ bản của lỗi Tràn Bộ Đệm (Buffer Overflow) trong lý thuyết.
5. Thực hành các kỹ thuật lập trình C++ an toàn, tránh sử dụng các hàm nguy hiểm như `strcpy`, `gets`.
6. Thực hành viết code đa luồng an toàn, đảm bảo tính toàn vẹn của bộ nhớ.

### English
In this week, students will learn how to design and manage multi-threaded applications using the C++ programming language. We will explore the differences between concurrency and parallelism, and how to synchronize data between threads to avoid race conditions and deadlocks. Additionally, a crucial part of the lesson is understanding memory layout in C++ (Stack and Heap) and the concept of Buffer Overflow vulnerabilities. Students will learn how to prevent these errors through defensive programming practices.

**Specific objectives include:**
1. Understand and apply the `<thread>` library introduced in C++11.
2. Master the fundamental concepts of Mutexes, Locks, and synchronization mechanisms.
3. Comprehend memory architecture: Code, Data, Heap, and Stack segments.
4. Grasp the theoretical principles of Buffer Overflow vulnerabilities.
5. Practice safe C++ programming techniques, avoiding dangerous functions like `strcpy` and `gets`.
6. Practice writing secure multi-threaded code, ensuring memory integrity.

---

## Linh Kiện & Dụng Cụ / Components & Tools

### Vietnamese
* Máy tính cá nhân (Windows, macOS hoặc Linux).
* Trình biên dịch C++ hỗ trợ chuẩn C++14 trở lên (GCC, Clang, hoặc MSVC).
* IDE / Trình soạn thảo mã nguồn: Visual Studio Code, CLion, hoặc Code::Blocks.
* Công cụ gỡ lỗi (Debugger): GDB hoặc lldb.
* Phần mềm phân tích tĩnh tĩnh (Static Analysis Tool): Cppcheck (tùy chọn nhưng khuyến khích).

### English
* Personal Computer (Windows, macOS, or Linux).
* C++ Compiler supporting C++14 or newer (GCC, Clang, or MSVC).
* IDE / Source Code Editor: Visual Studio Code, CLion, or Code::Blocks.
* Debugger: GDB or lldb.
* Static Analysis Tool: Cppcheck (optional but recommended).

---

## Lý Thuyết / Theory

### 1. Đa luồng trong C++ (Multi-threading in C++)

#### Vietnamese
Đa luồng cho phép một chương trình thực thi nhiều tác vụ đồng thời, tối ưu hóa việc sử dụng CPU đa nhân.
* **Luồng (Thread):** Là đơn vị thực thi nhỏ nhất trong một tiến trình. Các luồng trong cùng một tiến trình chia sẻ chung bộ nhớ Heap và Data, nhưng mỗi luồng có bộ nhớ Stack riêng.
* **Concurrency vs Parallelism:** Đồng thời (Concurrency) là việc xử lý nhiều tác vụ cùng một khoảng thời gian (có thể luân phiên), trong khi Song song (Parallelism) là việc thực thi nhiều tác vụ cùng một lúc trên các lõi CPU khác nhau.
* **Thư viện `<thread>`:** Cung cấp các công cụ chuẩn để tạo và quản lý luồng.
* **Tình trạng tương tranh (Race Condition):** Xảy ra khi hai hay nhiều luồng cùng truy cập và thay đổi một vùng nhớ chia sẻ mà không có cơ chế đồng bộ hóa, dẫn đến dữ liệu bị sai lệch.
* **Mutex (Mutual Exclusion):** Một cơ chế khóa để đảm bảo tại một thời điểm chỉ có một luồng được quyền truy cập vào tài nguyên chia sẻ.

#### English
Multi-threading allows a program to execute multiple tasks simultaneously, optimizing the use of multi-core CPUs.
* **Thread:** The smallest unit of execution within a process. Threads within the same process share the Heap and Data segments, but each thread has its own Stack.
* **Concurrency vs Parallelism:** Concurrency is dealing with multiple tasks in the same time frame (potentially interleaving), while Parallelism is executing multiple tasks literally at the same time on different CPU cores.
* **`<thread>` Library:** Provides standard tools for creating and managing threads.
* **Race Condition:** Occurs when two or more threads access and modify shared memory without synchronization, leading to corrupted data.
* **Mutex (Mutual Exclusion):** A locking mechanism to ensure that only one thread can access a shared resource at a given time.

### 2. Kiến trúc bộ nhớ C++ (C++ Memory Layout)

#### Vietnamese
Khi một chương trình C++ được thực thi, hệ điều hành cấp phát bộ nhớ cho nó, chia thành các phần chính:
* **Text Segment (Code):** Chứa các mã lệnh máy đã được biên dịch. Vùng nhớ này thường chỉ đọc (read-only).
* **Data Segment:** Chứa các biến toàn cục (global variables) và biến tĩnh (static variables) đã được khởi tạo.
* **BSS Segment:** Chứa các biến toàn cục và tĩnh chưa được khởi tạo (mặc định bằng 0).
* **Heap:** Vùng nhớ cấp phát động (dynamic memory allocation). Lập trình viên phải tự quản lý vùng này bằng các từ khóa `new` và `delete` (hoặc thông qua Smart Pointers).
* **Stack:** Vùng nhớ chứa các biến cục bộ (local variables), tham số hàm và thông tin điều khiển luồng (địa chỉ trả về - return address). Stack hoạt động theo nguyên tắc LIFO (Last In, First Out).

#### English
When a C++ program is executed, the OS allocates memory for it, divided into main segments:
* **Text Segment (Code):** Contains the compiled machine instructions. This region is typically read-only.
* **Data Segment:** Contains initialized global and static variables.
* **BSS Segment:** Contains uninitialized global and static variables (defaulted to 0).
* **Heap:** The region for dynamic memory allocation. Programmers must manage this region manually using `new` and `delete` (or via Smart Pointers).
* **Stack:** The memory region containing local variables, function parameters, and control flow information (return addresses). The stack operates on a LIFO (Last In, First Out) principle.

### 3. Lỗi Tràn Bộ Đệm (Buffer Overflow)

#### Vietnamese
**Lý thuyết cơ bản:**
Tràn bộ đệm xảy ra khi một chương trình ghi nhiều dữ liệu vào một khối bộ nhớ (buffer) hơn sức chứa của nó. Khi đó, dữ liệu dư thừa sẽ ghi đè lên các vùng nhớ lân cận.
* **Stack Buffer Overflow:** Xảy ra trên Stack. Nếu một biến cục bộ dạng mảng (ví dụ `char buffer[10]`) bị ghi đè dữ liệu vượt quá 10 byte, dữ liệu dư thừa có thể ghi đè lên địa chỉ trả về của hàm (return address). Khi hàm kết thúc, chương trình có thể nhảy tới một địa chỉ sai hoặc mã độc.
* **Heap Buffer Overflow:** Tương tự nhưng xảy ra trên Heap, có thể phá hỏng các cấu trúc quản lý bộ nhớ của Heap.

**Nguyên nhân phổ biến trong C/C++:**
* Sử dụng các hàm thao tác chuỗi không kiểm tra độ dài: `strcpy()`, `strcat()`, `gets()`, `sprintf()`.
* Thiếu kiểm tra ranh giới khi làm việc với mảng hoặc con trỏ.

#### English
**Basic Theory:**
A buffer overflow occurs when a program writes more data to a block of memory (buffer) than it was allocated to hold. The excess data overwrites adjacent memory regions.
* **Stack Buffer Overflow:** Occurs on the Stack. If a local array variable (e.g., `char buffer[10]`) is overwritten with more than 10 bytes, the excess data can overwrite the function's return address. When the function returns, the program might jump to an invalid address or malicious code.
* **Heap Buffer Overflow:** Similar concept but occurs on the Heap, potentially corrupting Heap management structures.

**Common causes in C/C++:**
* Using unbounded string manipulation functions: `strcpy()`, `strcat()`, `gets()`, `sprintf()`.
* Missing bounds checking when working with arrays or pointers.

### 4. Lập trình Phòng thủ & C++ An toàn (Defensive Programming & Safe C++)

#### Vietnamese
Để phòng ngừa các lỗi bộ nhớ, lập trình viên C++ hiện đại cần tuân thủ các quy tắc:
* **Tránh xa các hàm C cũ:** Không dùng `strcpy`, hãy dùng `strncpy` hoặc tốt hơn là dùng `std::string`. Không dùng `gets`, hãy dùng `std::getline`.
* **Sử dụng Container chuẩn:** Sử dụng `std::vector`, `std::array` thay cho mảng thuần túy (raw arrays). Các container này có phương thức `.at()` thực hiện kiểm tra ranh giới (bounds checking).
* **Quản lý bộ nhớ an toàn:** Thay vì dùng `new/delete` thuần túy, hãy sử dụng Smart Pointers (`std::unique_ptr`, `std::shared_ptr`) để tránh Memory Leak và Dangling Pointers.
* **Tôn trọng giới hạn của bộ đệm:** Luôn xác nhận độ dài của đầu vào từ người dùng hoặc hệ thống mạng trước khi sao chép dữ liệu.

#### English
To prevent memory errors, modern C++ programmers should adhere to these rules:
* **Avoid legacy C functions:** Do not use `strcpy`; use `strncpy` or preferably `std::string`. Do not use `gets`; use `std::getline`.
* **Use Standard Containers:** Use `std::vector`, `std::array` instead of raw arrays. These containers offer the `.at()` method which performs bounds checking.
* **Safe memory management:** Instead of raw `new/delete`, use Smart Pointers (`std::unique_ptr`, `std::shared_ptr`) to avoid Memory Leaks and Dangling Pointers.
* **Respect buffer limits:** Always validate the length of input from users or network systems before copying data.

---

## Sơ Đồ Cấu Hình Mạng / Network Topology

### Vietnamese
Trong bài học này, chúng ta tập trung vào bảo mật cấp ứng dụng (Application-level security) và xử lý nội bộ. Do đó không có sơ đồ mạng vật lý phức tạp. Cấu trúc liên quan chủ yếu là cấu trúc bộ nhớ nội bộ của tiến trình:
`[ Stack (Grows Down) ] <-----> [ Free Space ] <-----> [ Heap (Grows Up) ] <---- [ BSS / Data / Text ]`

### English
In this lesson, we focus on Application-level security and internal processing. Thus, there is no complex physical network topology. The relevant structure is primarily the internal memory layout of the process:
`[ Stack (Grows Down) ] <-----> [ Free Space ] <-----> [ Heap (Grows Up) ] <---- [ BSS / Data / Text ]`

---

## Thực Hành / Hands-On (Defensive/Safe coding focus)

### Vietnamese
Trong phần thực hành, chúng ta sẽ viết một ứng dụng đa luồng để xử lý nhiều yêu cầu chuỗi từ người dùng (giả lập server xử lý log). Mục tiêu là viết mã an toàn, không thể bị tràn bộ đệm.

**Bước 1: Khởi tạo Project và Luồng cơ bản**
Tạo một chương trình in ra lời chào từ nhiều luồng. Sử dụng `std::thread` và `std::vector<std::thread>`.

**Bước 2: Sử dụng Mutex để bảo vệ dữ liệu chia sẻ**
Tạo một biến đếm chung (`int counter`) và một `std::mutex`. Sử dụng `std::lock_guard` để bảo vệ việc tăng biến đếm, tránh Race Condition.

**Bước 3: Xử lý chuỗi an toàn (Safe String Handling)**
Viết hàm nhận đầu vào từ nhiều luồng và lưu vào một cấu trúc dữ liệu. Bắt buộc sử dụng `std::string` và các cơ chế kiểm tra giới hạn thay vì mảng char.

### English
In the hands-on session, we will write a multi-threaded application to process string requests from multiple users (simulating a log processing server). The goal is to write secure code that cannot be buffer-overflowed.

**Step 1: Project Initialization and Basic Threads**
Create a program that prints a greeting from multiple threads. Use `std::thread` and `std::vector<std::thread>`.

**Step 2: Using Mutex to protect shared data**
Create a shared counter (`int counter`) and a `std::mutex`. Use `std::lock_guard` to protect incrementing the counter, avoiding Race Conditions.

**Step 3: Safe String Handling**
Write a function that receives input from multiple threads and stores it in a data structure. Mandatory use of `std::string` and boundary-checking mechanisms instead of char arrays.

---

## Cảnh Báo An Toàn & Đạo Đức / Safety Warnings and Ethical Notices

### Vietnamese
* **Lưu ý Đạo Đức:** Mục đích của việc tìm hiểu về lỗi tràn bộ đệm là để **phòng thủ**. Việc viết mã khai thác (exploit code) để tấn công vào hệ thống không thuộc quyền sở hữu của bạn là hành vi bất hợp pháp và vi phạm nghiêm trọng đạo đức nghề nghiệp.
* **Thực hành an toàn:** Các bài tập thực hành phải chạy trên máy cục bộ hoặc môi trường ảo hóa an toàn (Sandbox).
* Chúng ta học cách hệ thống hỏng để xây dựng nó vững chắc hơn.

### English
* **Ethical Notice:** The purpose of learning about buffer overflows is for **defense**. Writing exploit code to attack systems you do not own is illegal and a severe violation of professional ethics.
* **Safe Practice:** Hands-on exercises must be run on local machines or secure virtualized environments (Sandboxes).
* We learn how systems break in order to build them more robustly.

---

## Code Mẫu / Code Samples (Secure coding examples)

### 1. Đồng bộ hóa đa luồng an toàn (Safe Multi-threading Synchronization)

```cpp
#include <iostream>
#include <thread>
#include <vector>
#include <mutex>
#include <string>

// Vietnamese: Biến toàn cục chia sẻ
// English: Shared global variable
int global_counter = 0;

// Vietnamese: Mutex bảo vệ biến chia sẻ
// English: Mutex protecting the shared variable
std::mutex counter_mutex;

void safe_increment(int iterations, int thread_id) {
    for (int i = 0; i < iterations; ++i) {
        // Vietnamese: Sử dụng lock_guard, tự động khóa khi khởi tạo và mở khóa khi ra khỏi scope
        // English: Using lock_guard, automatically locks on creation and unlocks when out of scope
        std::lock_guard<std::mutex> lock(counter_mutex);
        global_counter++;
        
        // Vietnamese: std::cout cũng cần được bảo vệ để tránh luồng in xen ngang nhau
        // English: std::cout also needs protection to avoid interlaced printing
        // std::cout << "Thread " << thread_id << " incremented counter to " << global_counter << "\n";
    }
}

int main() {
    const int num_threads = 5;
    const int iterations = 10000;
    std::vector<std::thread> threads;

    std::cout << "Starting safe multi-threaded counter..." << std::endl;

    for (int i = 0; i < num_threads; ++i) {
        threads.push_back(std::thread(safe_increment, iterations, i));
    }

    for (auto& th : threads) {
        if (th.joinable()) {
            th.join(); // Vietnamese: Đợi các luồng kết thúc / English: Wait for threads to finish
        }
    }

    std::cout << "Final counter value (Expected: 50000): " << global_counter << std::endl;
    return 0;
}
```

### 2. So sánh: Xử lý chuỗi Không An Toàn vs An Toàn (Unsafe vs Safe String Handling)

```cpp
#include <iostream>
#include <cstring>
#include <string>

// ---------------------------------------------------------
// ANTI-PATTERN: DO NOT USE IN PRODUCTION
// Vietnamese: Mã không an toàn, dễ bị tràn bộ đệm
// English: Unsafe code, vulnerable to buffer overflow
// ---------------------------------------------------------
void unsafe_copy(const char* input_data) {
    char buffer[10]; // Buffer of size 10 bytes
    
    // NGUY HIỂM / DANGER: strcpy does not check bounds!
    // If input_data > 9 chars, it will overflow the stack buffer.
    // std::strcpy(buffer, input_data); 
    
    std::cout << "[Unsafe Demo] Function returned." << std::endl;
}

// ---------------------------------------------------------
// BEST PRACTICE: SAFE C++
// Vietnamese: Mã an toàn sử dụng std::string
// English: Safe code using std::string
// ---------------------------------------------------------
void safe_process(const std::string& input_data) {
    // Vietnamese: std::string tự động quản lý bộ nhớ trên Heap
    // English: std::string automatically manages memory on the Heap
    std::string safe_buffer = input_data; 
    
    // Vietnamese: Kiểm tra độ dài an toàn nếu cần giới hạn logic
    // English: Safe length checking if logical limits are needed
    const size_t MAX_LEN = 10;
    if (safe_buffer.length() > MAX_LEN) {
        std::cout << "[Warning] Input truncated to fit logical limit.\n";
        safe_buffer = safe_buffer.substr(0, MAX_LEN);
    }
    
    std::cout << "Processed data safely: " << safe_buffer << std::endl;
}

int main() {
    // A string larger than 10 bytes
    std::string user_input = "This_is_a_very_long_string_for_testing";
    
    std::cout << "Running safe processing..." << std::endl;
    safe_process(user_input);
    
    // Uncommenting below in real C code with strcpy would cause a crash or vulnerability
    // unsafe_copy(user_input.c_str());
    
    return 0;
}
```

### 3. Truy cập mảng an toàn (Safe Array Access)

```cpp
#include <iostream>
#include <vector>
#include <stdexcept>

void access_data_safely() {
    std::vector<int> numbers = {10, 20, 30, 40, 50};
    
    // Vietnamese: Cố gắng truy cập phần tử ngoài mảng
    // English: Attempting to access an out-of-bounds element
    int index_to_access = 10; 
    
    try {
        // NGUY HIỂM / DANGER: 
        // int val = numbers[index_to_access]; // Undefined behavior, no bounds checking
        
        // AN TOÀN / SAFE:
        // Vietnamese: Hàm .at() sẽ ném ra ngoại lệ out_of_range nếu truy cập sai
        // English: The .at() method throws an out_of_range exception on invalid access
        int val = numbers.at(index_to_access); 
        std::cout << "Value: " << val << std::endl;
        
    } catch (const std::out_of_range& e) {
        std::cerr << "Caught Out-Of-Bounds exception: " << e.what() << '\n';
        std::cerr << "This prevented a potential memory corruption vulnerability!\n";
    }
}
```

---

## Câu Hỏi Thảo Luận / Discussion

### Vietnamese
1. Tại sao `std::string` trong C++ lại an toàn hơn so với mảng ký tự `char array[]` truyền thống của C?
2. Giải thích cơ chế hoạt động của `std::lock_guard` và tại sao nó tuân thủ nguyên tắc RAII (Resource Acquisition Is Initialization).
3. Nếu hai luồng cùng cố gắng truy cập và ghi đè vào một vùng nhớ bị tràn bộ đệm, điều gì tồi tệ nhất có thể xảy ra đối với toàn vẹn dữ liệu?
4. Stack buffer overflow thường có thể bị kẻ tấn công lợi dụng để làm gì? Nêu cách phòng chống cơ bản.
5. Tại sao không nên dùng hàm `gets()` để lấy dữ liệu từ bàn phím?

### English
1. Why is `std::string` in C++ safer than the traditional C-style `char array[]`?
2. Explain how `std::lock_guard` works and why it adheres to the RAII (Resource Acquisition Is Initialization) principle.
3. If two threads attempt to access and overwrite a memory region via a buffer overflow simultaneously, what is the worst-case scenario for data integrity?
4. What do attackers typically exploit a Stack buffer overflow for? Name a basic prevention method.
5. Why should you never use the `gets()` function to retrieve keyboard input?

---

## Bài Về Nhà / Homework

### Vietnamese
**Bài tập 1:** Viết một chương trình C++ đa luồng mô phỏng một hệ thống bán vé. Có 3 luồng đại diện cho 3 quầy bán vé. Số lượng vé tổng cộng là 100.
* Yêu cầu: Sử dụng `std::mutex` để đảm bảo tổng số vé bán ra chính xác là 100 và không bị bán âm (dưới 0 vé). In ra log an toàn cho mỗi lần bán vé.
* Mục đích: Luyện tập đồng bộ hóa và chống Race Condition.

**Bài tập 2:** Refactor (viết lại) đoạn mã C cũ kỹ sau đây sang C++ hiện đại, sử dụng `std::string` và loại bỏ hoàn toàn các hàm quản lý chuỗi không an toàn.
```c
// Đoạn mã không an toàn:
#include <stdio.h>
#include <string.h>
void processRequest(char* req) {
    char logMsg[50];
    strcpy(logMsg, "Log: ");
    strcat(logMsg, req);
    printf("%s\n", logMsg);
}
```
* Yêu cầu: Viết lại hàm `processRequest` bằng C++ sử dụng thư viện `<string>` và `<iostream>`. Không dùng mảng tĩnh.

### English
**Task 1:** Write a multi-threaded C++ program simulating a ticket sales system. There are 3 threads representing 3 ticket counters. The total number of tickets is 100.
* Requirement: Use `std::mutex` to ensure exactly 100 tickets are sold without selling negative tickets (below 0). Print a thread-safe log for each sale.
* Purpose: Practice synchronization and preventing Race Conditions.

**Task 2:** Refactor the following legacy C code into modern C++, using `std::string` and completely removing unsafe string manipulation functions.
```c
// Unsafe code snippet:
#include <stdio.h>
#include <string.h>
void processRequest(char* req) {
    char logMsg[50];
    strcpy(logMsg, "Log: ");
    strcat(logMsg, req);
    printf("%s\n", logMsg);
}
```
* Requirement: Rewrite the `processRequest` function in C++ using the `<string>` and `<iostream>` libraries. Do not use static arrays.

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí / Criteria | Xuất Sắc / Excellent (9-10) | Khá / Good (7-8) | Cơ Bản / Basic (5-6) | Cần Cố Gắng / Needs Work (<5) |
|---------------------|-----------------------------|------------------|----------------------|---------------------------------|
| **Đa luồng (Threading)** | Ứng dụng chạy mượt mà, không deadlock, sử dụng RAII (lock_guard) hoàn hảo. | Chạy tốt nhưng quản lý lock/unlock thủ công, có nguy cơ nhỏ. | Tạo được luồng nhưng đồng bộ hóa chưa tốt (Race condition). | Chương trình crash hoặc chạy sai logic luồng. |
| **Xử lý Bộ Nhớ (Memory)** | Loại bỏ 100% mảng C-style, dùng std::string/vector an toàn, code clean. | Dùng std::string hầu hết các nơi, còn sót 1-2 cảnh báo nhỏ. | Có nhận thức về tràn bộ đệm nhưng vẫn nhầm lẫn kiểu dữ liệu. | Code vẫn dùng strcpy/gets, nguy cơ tràn bộ đệm rõ ràng. |
| **Hiểu biết Lý Thuyết** | Trả lời sắc sảo câu hỏi thảo luận, liên hệ thực tế tốt. | Trả lời đúng các ý chính, hiểu khái niệm Stack/Heap. | Trả lời được nhưng còn lúng túng giữa Concurrency và Parallelism. | Không nắm được nguyên lý bộ nhớ và đồng bộ hóa. |
| **English / Vietnamese** | Code comments song ngữ rõ ràng, đặt tên biến chuẩn xác. | Comment khá rõ ràng, hiểu tài liệu tiếng Anh. | Đặt tên biến lộn xộn, ít chú thích. | Code không có chú thích, khó hiểu. |

---
*End of Week 4 Lesson Plan*

---

## Phụ Lục Chuyên Sâu (Deep-Dive Appendix): Kỹ Thuật Đọc Memory Dump & Biên Dịch An Toàn C++

### 1. Cơ chế Bảo vệ Bộ Nhớ Mặc định của Trình biên dịch (Compiler Defenses)
Các trình biên dịch hiện đại (GCC, Clang, MSVC) được tích hợp sẵn các cơ chế bảo mật nhằm giảm thiểu tác động của lỗi tràn bộ đệm:
- **Stack Canaries (-fstack-protector):** Chèn một giá trị bí mật (Canary) vào giữa biến cục bộ và Return Address trên Stack. Khi hàm kết thúc, trình biên dịch kiểm tra xem Canary có bị thay đổi không. Nếu có, chương trình lập tức dừng (`Aborted / Segmentation Fault`) để ngăn chặn thực thi mã độc.
- **ASLR (Address Space Layout Randomization):** Ngẫu nhiên hóa địa chỉ vùng nhớ Stack, Heap, và Libraries mỗi khi chương trình khởi chạy, khiến kẻ tấn công khó đoán địa chỉ bộ nhớ.
- **DEP / NX Bit (Data Execution Prevention / No-Execute):** Đánh dấu vùng nhớ Stack và Heap là KHÔNG THỂ THỰC THI (Non-executable), ngăn chặn việc chèn và chạy shellcode trực tiếp từ Stack.

### 2. Bảng So Sánh Các Hàm Chuỗi Trong C/C++ (Safe vs Unsafe String Functions)

| Hàm không an toàn (DANGER) | Hàm thay thế an toàn (SECURE) | Ghi chú an toàn |
| :--- | :--- | :--- |
| `strcpy(dest, src)` | `strncpy_s()` hoặc `std::string` | `strcpy` không kiểm tra độ dài buffer đích. |
| `strcat(dest, src)` | `strncat_s()` hoặc `operator+` | `strcat` gây tràn bộ đệm khi nối chuỗi dài. |
| `gets(buffer)` | `fgets(buffer, size, stdin)` | `gets()` đã bị gỡ bỏ hoàn toàn khỏi chuẩn C11. |
| `sprintf(buf, fmt, ...)` | `snprintf(buf, size, fmt, ...)` | `snprintf` giới hạn số ký tự tối đa được ghi. |
## Code minh họa theo buổi

- [Danh sách 20 code tuần 04](../code/week04/README.md) — học lần lượt từ `01_...` đến `20_...`.
## 20 code minh họa của tuần

- [Mở mục lục code tuần 04](../code/week04/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 04](../code/week04/README.md), học lần lượt từ `01_...` đến `20_...`.
