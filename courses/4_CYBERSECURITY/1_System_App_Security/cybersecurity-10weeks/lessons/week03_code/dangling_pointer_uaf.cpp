#include <iostream>

using namespace std;

int main() {
    cout << "=== DEMO LỖ HỔNG USE-AFTER-FREE (DANGLING POINTER) ===" << endl;

    int* ptr = new int(1337);
    cout << "[+] Đã cấp phát bộ nhớ Heap: *ptr = " << *ptr << endl;

    // Giải phóng bộ nhớ
    delete ptr;
    cout << "[!] Đã gọi 'delete ptr' (Giải phóng bộ nhớ về cho OS)..." << endl;

    // LỖI BẢO MẬT: Không gán ptr = nullptr
    // Con trỏ vẫn giữ địa chỉ cũ. Việc truy cập lúc này gọi là Use-After-Free (UAF)
    cout << "[⚠️ VULNERABILITY] Giá trị đọc được từ vùng nhớ đã giải phóng (Undefined Behavior): " << *ptr << endl;

    // SỬA LỖI BẢO MẬT:
    ptr = nullptr;
    if (ptr != nullptr) {
        cout << *ptr << endl;
    } else {
        cout << "[✅ SECURE] Con trỏ đã được đặt về nullptr an toàn!" << endl;
    }

    return 0;
}
