#include <iostream>
#include <cstring>

// Hàm dễ bị tổn thương tràn bộ đệm
// Vulnerable function prone to buffer overflow
void vulnerable_function(char* input_str) {
    char buffer[16];
    
    // NGUY HIỂM: strcpy không kiểm tra xem kích thước chuỗi đầu vào 'input_str'
    // có vượt quá kích thước được cấp phát (16 bytes) của 'buffer' hay không.
    // WARNING: strcpy does not check if the size of 'input_str' exceeds
    // the allocated size (16 bytes) of 'buffer'.
    std::strcpy(buffer, input_str); 
    
    std::cout << "[+] Đã nạp vào bộ đệm / Data loaded into buffer: " << buffer << std::endl;
}

int main(int argc, char* argv[]) {
    if (argc < 2) {
        std::cout << "Cách chạy / Usage: " << argv[0] << " <chuỗi_đầu_vào / input_string>" << std::endl;
        return 1;
    }
    
    std::cout << "[*] Khởi chạy kiểm thử bộ nhớ... / Launching memory test..." << std::endl;
    vulnerable_function(argv[1]);
    
    std::cout << "[+] Kết thúc chương trình an toàn! / Program exited safely!" << std::endl;
    return 0;
}

/*
👉 CÁCH KHẮC PHỤC AN TOÀN / HOW TO FIX:
Thay vì dùng std::strcpy, hãy dùng std::strncpy để giới hạn số ký tự sao chép:
Use std::strncpy instead of std::strcpy to restrict the copied characters count:
    std::strncpy(buffer, input_str, sizeof(buffer) - 1);
    buffer[sizeof(buffer) - 1] = '\0';
*/
