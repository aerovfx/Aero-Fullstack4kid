// Tuần 04 · Bài 12: Kiểm tra độ dài input.
// Ví dụ C++17 phòng thủ: container tự quản lý bộ nhớ và kiểm tra biên.
#include <array>
#include <iostream>
#include <string>

int main() {
    const std::array<int, 3> scores{12, 22, 32};
    const std::string lesson = "Kiểm tra độ dài input";
    int total = 0;
    for (std::size_t i = 0; i < scores.size(); ++i) total += scores.at(i);
    std::cout << "12 - " << lesson << ": " << total << '\n';
    return 0;
}
