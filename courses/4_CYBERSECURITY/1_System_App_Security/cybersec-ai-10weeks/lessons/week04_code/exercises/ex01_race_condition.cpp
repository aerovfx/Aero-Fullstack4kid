// ex01_race_condition.cpp
//
// BÀI TẬP 1 (Tuần 4): SỬA LỖI RACE CONDITION BẰNG MUTEX
// Ôn lại: <thread>, <mutex>, lock_guard, join().
//
// BỐI CẢNH:
// 10 luồng, mỗi luồng cộng biến `counter` lên 100000 lần. Đáp án ĐÚNG phải là
// 10 * 100000 = 1000000. Nhưng nếu không khóa, các luồng ghi đè lẫn nhau
// (race condition) và kết quả sẽ NHỎ HƠN, thay đổi mỗi lần chạy.
//
// NHIỆM VỤ:
// 1. Chạy thử bản chưa khóa để TẬN MẮT thấy con số sai (bỏ comment phần "không khóa").
// 2. Dùng std::mutex + lock_guard bảo vệ phép cộng để ra đúng 1000000.
//
// Liên hệ bảo mật: race condition (TOCTOU) là một lớp lỗ hổng thực sự - kẻ tấn
// công chen vào giữa hai thao tác để vượt qua kiểm tra quyền.
//
// BIÊN DỊCH:  g++ -std=c++17 ex01_race_condition.cpp -o race -pthread && ./race

#include <iostream>
#include <thread>
#include <vector>
#include <mutex>
using namespace std;

long long counter = 0;
const int NUM_THREADS = 10;
const int LOOPS = 100000;

// TODO 1: Khai báo một mutex toàn cục.
// mutex counter_mtx;

void worker() {
    for (int i = 0; i < LOOPS; ++i) {
        // TODO 2: Khóa mutex TRƯỚC khi chạm vào counter, dùng lock_guard để tự mở khóa.
        //   lock_guard<mutex> lock(counter_mtx);
        counter++;
    }
}

int main() {
    cout << "=== RACE CONDITION DEMO ===" << endl;

    vector<thread> threads;
    // TODO 3: Tạo NUM_THREADS luồng cùng chạy worker, lưu vào vector.

    // TODO 4: join() tất cả các luồng.

    cout << "Kết quả counter = " << counter << endl;
    cout << "Kết quả ĐÚNG   = " << (long long)NUM_THREADS * LOOPS << endl;
    cout << (counter == (long long)NUM_THREADS * LOOPS
             ? "[+] CHÍNH XÁC - đã đồng bộ tốt!"
             : "[-] SAI - có race condition, chưa khóa đúng!") << endl;
    return 0;
}
