// ĐÁP ÁN - Bài tập 2 (Tuần 3): Mảng động trên Heap, không rò rỉ bộ nhớ.
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

    int* arr = new int[n];   // cấp phát trên Heap

    for (int i = 0; i < n; ++i) {
        cout << "arr[" << i << "] = ";
        cin >> arr[i];
    }

    int max_val = INT_MIN;
    for (int i = 0; i < n; ++i) {
        if (arr[i] > max_val) {
            max_val = arr[i];
        }
    }

    cout << "[+] Giá trị lớn nhất: " << max_val << endl;

    delete[] arr;    // giải phóng MẢNG bằng delete[], không phải delete
    arr = nullptr;   // tránh dangling pointer

    return 0;
}
