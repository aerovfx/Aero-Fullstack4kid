// Tuần 04 · Bài 08: Giới hạn số worker.
// Ví dụ C++17 phòng thủ: container tự quản lý bộ nhớ và kiểm tra biên.
#include <array>
#include <iostream>
#include <string>

int main() {
    const std::array<int, 3> scores{8, 18, 28};
    const std::string lesson = "Giới hạn số worker";
    int total = 0;
    for (std::size_t i = 0; i < scores.size(); ++i) total += scores.at(i);
    std::cout << "08 - " << lesson << ": " << total << '\n';
    return 0;
}
