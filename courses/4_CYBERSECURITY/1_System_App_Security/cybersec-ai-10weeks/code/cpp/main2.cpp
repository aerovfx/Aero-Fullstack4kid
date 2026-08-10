/* Chuong trinh C/C++ dau tien
   Day la noi mo ta thong tin cua
   chuong trinh */
#include <iostream> // Thư viện vào/ra chuẩn của C++
using namespace std; // Sử dụng không gian tên chuẩn

// 1. KHAI BÁO MẪU HÀM (Function Prototype)
int Cong(int a, int b);

// 2. HÀM CHÍNH (main)
int main() {
    cout << "Cong hai so: "; 
    cout << Cong(10, 5) << endl; // Gọi hàm và in ra kết quả
    
    cout << "Nhan Enter de thoat...";
    cin.get(); // Dừng màn hình chờ nhấn Enter (thay thế cho getch)
    
    return 0; 
}

// 3. ĐỊNH NGHĨA HÀM CON (Function Definition)
int Cong(int a, int b) {
    return a + b; 
}