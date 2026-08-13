// Tuần 03 · Bài 15: RAII resource.
// Ví dụ C++17 phòng thủ: container tự quản lý bộ nhớ và kiểm tra biên.
#include <array>
#include <iostream>
#include <string>

int main() {
    const std::array<int, 3> scores{15, 25, 35};
    const std::string lesson = "RAII resource";
    int total = 0;
    for (std::size_t i = 0; i < scores.size(); ++i) total += scores.at(i);
    std::cout << "15 - " << lesson << ": " << total << '\n';
    return 0;
}
