#include <iostream>

using namespace std;

int main() {
    cout << "=== CYBERSEC AI: DEMO CON TRỎ CƠ BẢN (POINTER BASICS) ===" << endl;
    
    int secret_code = 1337;
    int* ptr = &secret_code; // ptr lưu địa chỉ bộ nhớ của secret_code

    cout << "[+] Gia tri cua secret_code: " << secret_code << endl;
    cout << "[+] Dia chi bo nho của secret_code (&secret_code): " << &secret_code << endl;
    cout << "[+] Gia tri cua con tro ptr (dia chi tro toi): " << ptr << endl;
    cout << "[+] Gia tri tai dia chi ma ptr tro toi (*ptr): " << *ptr << endl;

    // Thay đổi giá trị gián tiếp thông qua con trỏ
    cout << "\n[!] Đang thay đổi giá trị thông qua con trỏ: *ptr = 9999..." << endl;
    *ptr = 9999;

    cout << "[+] Gia tri moi cua secret_code: " << secret_code << endl;

    return 0;
}
