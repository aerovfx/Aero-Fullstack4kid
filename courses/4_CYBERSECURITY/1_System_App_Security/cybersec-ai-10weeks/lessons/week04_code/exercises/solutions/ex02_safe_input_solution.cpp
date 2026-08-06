// ĐÁP ÁN - Bài tập 2 (Tuần 4): Nhập liệu an toàn chống tràn bộ đệm.
#include <iostream>
#include <cstring>
#include <string>
#include <algorithm>   // std::min
using namespace std;

void register_username(const string& input) {
    char buffer[16];   // 15 ký tự + '\0'

    size_t safe_len = min(input.length(), sizeof(buffer) - 1);
    strncpy(buffer, input.c_str(), safe_len);
    buffer[safe_len] = '\0';   // strncpy KHÔNG tự thêm null-terminator

    if (input.length() > sizeof(buffer) - 1) {
        cout << "[!] Cảnh báo: tên dài " << input.length()
             << " ký tự, đã cắt còn " << (sizeof(buffer) - 1) << "." << endl;
    }
    cout << "[+] Username đã lưu: " << buffer << endl;
}

int main() {
    cout << "=== NHẬP LIỆU AN TOÀN (CHỐNG BUFFER OVERFLOW) ===" << endl;
    register_username("alice");
    register_username("this_is_a_very_long_username_overflow");
    return 0;
}
