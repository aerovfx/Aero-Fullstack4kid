// ĐÁP ÁN - Bài tập 1 (Tuần 4): Sửa race condition bằng mutex.
#include <iostream>
#include <thread>
#include <vector>
#include <mutex>
using namespace std;

long long counter = 0;
const int NUM_THREADS = 10;
const int LOOPS = 100000;

mutex counter_mtx;

void worker() {
    for (int i = 0; i < LOOPS; ++i) {
        lock_guard<mutex> lock(counter_mtx);  // tự mở khóa khi hết vòng lặp
        counter++;
    }
}

int main() {
    cout << "=== RACE CONDITION DEMO ===" << endl;

    vector<thread> threads;
    for (int i = 0; i < NUM_THREADS; ++i) {
        threads.push_back(thread(worker));
    }
    for (auto& t : threads) {
        t.join();
    }

    cout << "Kết quả counter = " << counter << endl;
    cout << "Kết quả ĐÚNG   = " << (long long)NUM_THREADS * LOOPS << endl;
    cout << (counter == (long long)NUM_THREADS * LOOPS
             ? "[+] CHÍNH XÁC - đã đồng bộ tốt!"
             : "[-] SAI - có race condition, chưa khóa đúng!") << endl;
    return 0;
}
// GHI CHÚ: bỏ dòng lock_guard đi, biên dịch lại và chạy vài lần - bạn sẽ thấy
// counter ra số khác nhau và luôn NHỎ HƠN 1000000. Đó là race condition.
