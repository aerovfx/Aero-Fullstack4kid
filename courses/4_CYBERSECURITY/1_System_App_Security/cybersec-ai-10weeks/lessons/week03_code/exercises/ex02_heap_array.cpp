// ex02_heap_array.cpp
//
// BÀI TẬP 2 (Tuần 3): MẢNG ĐỘNG TRÊN HEAP, KHÔNG RÒ RỈ BỘ NHỚ
// Ôn lại: new[] / delete[], phân biệt Stack vs Heap, dangling pointer.
//
// NHIỆM VỤ:
// 1. Hỏi người dùng nhập số lượng phần tử n.
// 2. Cấp phát ĐỘNG một mảng int n phần tử trên HEAP bằng new[].
// 3. Cho người dùng nhập n số, tìm giá trị LỚN NHẤT.
// 4. Giải phóng bộ nhớ bằng delete[] và đặt con trỏ về nullptr.
//
// Vì sao quan trọng: quên delete[] = rò rỉ bộ nhớ (memory leak); dùng lại
// con trỏ sau khi delete = Use-After-Free. Đây là gốc của nhiều lỗ hổng.
//
// BIÊN DỊCH & CHẠY:
//   g++ ex02_heap_array.cpp -o heap && ./heap

#include <iostream>
#include <climits>
using namespace std;

int main() {
    cout << "=== MẢNG ĐỘNG TRÊN HEAP ===" << endl;

    int n;
    cout << "Nhập số phần tử: ";
    cin >> n;

    if (n <= 0) {
        cout << "[-] Số phần tử phải > 0." << endl;
        return 1;
    }

    // TODO 1: Cấp phát mảng int n phần tử trên Heap.
    //   int* arr = new int[n];
    int* arr = nullptr;

    // TODO 2: Vòng lặp cho người dùng nhập n giá trị vào arr[i].

    // TODO 3: Tìm giá trị lớn nhất. Gợi ý: khởi tạo max_val = INT_MIN rồi so sánh.
    int max_val = INT_MIN;

    cout << "[+] Giá trị lớn nhất: " << max_val << endl;

    // TODO 4: Giải phóng bộ nhớ Heap đúng cách cho MẢNG (dùng delete[], không phải delete).
    //   delete[] arr;
    //   arr = nullptr;   // tránh dangling pointer

    return 0;
}
