// ex02_safe_input.cpp
//
// BÀI TẬP 2 (Tuần 4): NHẬP LIỆU AN TOÀN - CHỐNG TRÀN BỘ ĐỆM
// Ôn lại: buffer overflow, strncpy vs strcpy, bounds checking.
//
// BỐI CẢNH:
// Hàm register_username lưu tên vào một buffer 16 byte. Bản gốc dùng strcpy -
// nếu tên dài hơn 15 ký tự sẽ TRÀN, ghi đè bộ nhớ kế bên (đây chính là lỗ hổng
// buffer overflow kinh điển).
//
// NHIỆM VỤ:
// Viết lại register_username sao cho:
// 1. KHÔNG BAO GIỜ ghi quá sizeof(buffer) - 1 ký tự.
// 2. Luôn kết thúc chuỗi bằng '\0'.
// 3. Cảnh báo nếu tên bị cắt bớt.
//
// BIÊN DỊCH:  g++ -std=c++17 ex02_safe_input.cpp -o safe && ./safe

#include <iostream>
#include <cstring>
#include <string>
using namespace std;

void register_username(const string& input) {
    char buffer[16];   // chỉ chứa được 15 ký tự + '\0'

    // TODO 1: Tính số ký tự AN TOÀN được phép chép:
    //   size_t safe_len = min(input.length(), sizeof(buffer) - 1);
    // TODO 2: strncpy(buffer, input.c_str(), safe_len);
    // TODO 3: buffer[safe_len] = '\0';   // BẮT BUỘC - strncpy không tự thêm
    // TODO 4: nếu input.length() > sizeof(buffer) - 1 thì in cảnh báo "đã cắt bớt".

    cout << "[+] Username đã lưu: " << buffer << endl;
}

int main() {
    cout << "=== NHẬP LIỆU AN TOÀN (CHỐNG BUFFER OVERFLOW) ===" << endl;

    register_username("alice");                                  // ngắn, bình thường
    register_username("this_is_a_very_long_username_overflow");  // dài, phải bị cắt an toàn

    return 0;
}
