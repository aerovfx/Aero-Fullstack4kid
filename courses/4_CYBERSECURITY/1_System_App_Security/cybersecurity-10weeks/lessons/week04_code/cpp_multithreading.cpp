#include <iostream>
#include <thread>
#include <vector>
#include <mutex>

using namespace std;

mutex mtx; // Mutex để đồng bộ hóa việc in ấn ra console

void workerTask(int id) {
    // Khóa console để không bị đè chữ giữa các luồng
    lock_guard<mutex> lock(mtx);
    cout << "[Thread " << id << "] Đang chạy trên CPU core..." << endl;
}

int main() {
    cout << "=== DEMO ĐA LUỒNG C++ (<thread>) ===" << endl;

    vector<thread> threads;
    int num_threads = 5;

    // Tạo và khởi chạy 5 luồng
    for (int i = 1; i <= num_threads; ++i) {
        threads.push_back(thread(workerTask, i));
    }

    // Đợi tất cả các luồng hoàn thành
    for (auto& t : threads) {
        if (t.joinable()) {
            t.join();
        }
    }

    cout << "[+] Tất cả luồng đã hoàn thành công việc!" << endl;
    return 0;
}
