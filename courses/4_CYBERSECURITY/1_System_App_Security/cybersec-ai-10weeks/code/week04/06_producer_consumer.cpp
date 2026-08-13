// Tuần 04 · Bài 06: Producer consumer.
// Ví dụ C++17 phòng thủ: container tự quản lý bộ nhớ và kiểm tra biên.
#include <array>
#include <iostream>
#include <string>

int main() {
    const std::array<int, 3> scores{6, 16, 26};
    const std::string lesson = "Producer consumer";
    int total = 0;
    for (std::size_t i = 0; i < scores.size(); ++i) total += scores.at(i);
    std::cout << "06 - " << lesson << ": " << total << '\n';
    return 0;
}
