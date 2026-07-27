#include <iostream>
#include <thread>
#include <vector>
#include <mutex>

using namespace std;

int remaining_tickets = 100;
mutex ticket_mutex;

void sellTickets(int counter_id) {
    while (true) {
        // Lock_guard đảm bảo tự động unlock khi ra khỏi scope
        lock_guard<mutex> lock(ticket_mutex);
        
        if (remaining_tickets > 0) {
            cout << "[Counter " << counter_id << "] Sold ticket #" << remaining_tickets << endl;
            remaining_tickets--;
        } else {
            break; // Hết vé
        }
    }
}

int main() {
    cout << "=== THỰC HÀNH MÔ PHỎNG BÁN VÉ ĐA LUỒNG AN TOÀN (MUTEX) ===" << endl;
    
    vector<thread> counters;
    for (int i = 1; i <= 3; ++i) {
        counters.push_back(thread(sellTickets, i));
    }
    
    for (auto& t : counters) {
        t.join();
    }
    
    cout << "[+] Tất cả vé đã được bán hết an toàn! Số vé còn lại: " << remaining_tickets << endl;
    return 0;
}
