#include <iostream>
#include <cstring>
#include <string>

using namespace std;

// Hàm minh họa mã không an toàn (Vulnerable Code Concept)
void unsafeCopy(const char* input) {
    char buffer[10];
    cout << "\n--- [VULNERABLE METHOD] ---" << endl;
    cout << "Kích thước buffer: 10 bytes." << endl;
    
    // CẢNH BÁO: strcpy không kiểm tra độ dài input!
    // Nếu input > 10 bytes, sẽ gây ra Buffer Overflow.
    // Trong thực tế, KHÔNG BAO GIỜ sử dụng strcpy.
    cout << "[!] Tránh dùng strcpy/gets trong C/C++!" << endl;
}

// Hàm minh họa lập trình phòng thủ an toàn (Defensive Programming)
void secureCopy(const string& input) {
    char buffer[10];
    cout << "\n--- [SECURE METHOD] ---" << endl;

    // Sử dụng strncpy hoặc std::string với bounds checking
    size_t safe_len = min(input.length(), sizeof(buffer) - 1);
    strncpy(buffer, input.c_str(), safe_len);
    buffer[safe_len] = '\0'; // Đảm bảo null-terminated

    cout << "[✅ SECURE] Kết quả sao chép an toàn (tối đa 9 ký tự): " << buffer << endl;
}

int main() {
    cout << "=== DEMO LẬP TRÌNH PHÒNG THỦ TRÁNH TRÀN BỘ ĐỆM (BUFFER OVERFLOW) ===" << endl;
    
    string user_input = "Chuoi_Van_Ban_Rat_Dai_Vuot_Qua_Kich_Thuoc_10_Bytes";
    cout << "Độ dài chuỗi đầu vào: " << user_input.length() << " bytes." << endl;

    unsafeCopy(user_input.c_str());
    secureCopy(user_input);

    return 0;
}
