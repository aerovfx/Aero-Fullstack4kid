#include <iostream>
#include <vector>
#include <string>
#include <thread>
#include <mutex>

#ifdef _WIN32
    #include <winsock2.h>
    #pragma comment(lib, "ws2_32.lib")
#else
    #include <sys/socket.h>
    #include <arpa/inet.h>
    #include <unistd.h>
#endif

// Mutex để bảo vệ tài nguyên chia sẻ khi in dữ liệu ra terminal từ nhiều luồng
// Mutex to protect shared resource (console output) when printing from multiple threads
std::mutex console_mtx;
std::vector<int> open_ports;

void scan_port(const std::string& ip, int port) {
    #ifdef _WIN32
        SOCKET sock = socket(AF_INET, SOCK_STREAM, 0);
    #else
        int sock = socket(AF_INET, SOCK_STREAM, 0);
    #endif

    if (sock < 0) return;

    sockaddr_in addr;
    addr.sin_family = AF_INET;
    addr.sin_port = htons(port);
    
    #ifdef _WIN32
        addr.sin_addr.s_addr = inet_addr(ip.c_str());
        DWORD timeout = 400; // 400ms timeout
        setsockopt(sock, SOL_SOCKET, SO_SNDTIMEO, (const char*)&timeout, sizeof(timeout));
        int result = connect(sock, (struct sockaddr*)&addr, sizeof(addr));
        closesocket(sock);
    #else
        inet_pton(AF_INET, ip.c_str(), &addr.sin_addr);
        struct timeval tv;
        tv.tv_sec = 0;
        tv.tv_usec = 400000; // 400ms timeout
        setsockopt(sock, SOL_SOCKET, SO_SNDTIMEO, (const char*)&tv, sizeof(tv));
        int result = connect(sock, (struct sockaddr*)&addr, sizeof(addr));
        close(sock);
    #endif

    if (result == 0) {
        std::lock_guard<std::mutex> lock(console_mtx);
        std::cout << "[+] Cổng " << port << " đang MỞ / Port " << port << " is OPEN!" << std::endl;
        open_ports.push_back(port);
    }
}

int main(int argc, char* argv[]) {
    std::string ip = "127.0.0.1";
    int start_port = 1;
    int end_port = 1024;

    if (argc >= 2) ip = argv[1];

    #ifdef _WIN32
        WSADATA wsa;
        WSAStartup(MAKEWORD(2,2), &wsa);
    #endif

    std::cout << "[*] Đang quét / Scanning " << ip << " từ cổng / from port " << start_port << " đến / to " << end_port << std::endl;

    std::vector<std::thread> threads;
    for (int port = start_port; port <= end_port; ++port) {
        threads.push_back(std::thread(scan_port, ip, port));
        // Giới hạn tối đa 64 luồng đồng thời để tránh quá tải OS
        // Limit to max 64 concurrent threads to prevent OS overhead
        if (threads.size() >= 64) {
            for (auto& t : threads) t.join();
            threads.clear();
        }
    }

    // Đợi các luồng cuối hoàn thành
    // Wait for remaining threads to complete
    for (auto& t : threads) t.join();

    #ifdef _WIN32
        WSACleanup();
    #endif

    std::cout << "[*] Hoàn thành quét cổng! Tìm thấy / Scan complete! Found: " << open_ports.size() << " ports open." << std::endl;
    return 0;
}
