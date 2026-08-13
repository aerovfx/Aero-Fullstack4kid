// Tuần 03 · Bài 03: Vòng lặp qua sự kiện.
// Ví dụ C++17 phòng thủ: container tự quản lý bộ nhớ và kiểm tra biên.
#include <array>
#include <iostream>
#include <string>

int main() {
    const std::array<int, 3> scores{3, 13, 23};
    const std::string lesson = "Vòng lặp qua sự kiện";
    int total = 0;
    for (std::size_t i = 0; i < scores.size(); ++i) total += scores.at(i);
    std::cout << "03 - " << lesson << ": " << total << '\n';
    return 0;
}
