#include <iostream> // Thư viện hỗ trợ nhập (cin) và xuất (cout) dữ liệu
using namespace std; // Sử dụng không gian tên chuẩn để không cần viết "std::" trước cout, cin

int main() {
    double a, b; // Khai báo 2 biến 'a' và 'b' kiểu số thực (chứa được cả số nguyên và số thập phân)

    cout << "Nhap a va b: "; // In dòng thông báo ra màn hình
    cin >> a >> b;          // Nhập giá trị cho a và b từ bàn phím (cách nhau bằng phím Space hoặc Enter)

    cout << "Tong: " << a + b; // Tính trực tiếp tổng (a + b) và in ra màn hình
}