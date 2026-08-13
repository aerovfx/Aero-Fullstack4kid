// Tuần 04 · Bài 17: Compiler warnings.
// Ví dụ C++17 phòng thủ: container tự quản lý bộ nhớ và kiểm tra biên.
#include <array>
#include <iostream>
#include <string>

int main() {
    const std::array<int, 3> scores{17, 27, 37};
    const std::string lesson = "Compiler warnings";
    int total = 0;
    for (std::size_t i = 0; i < scores.size(); ++i) total += scores.at(i);
    std::cout << "17 - " << lesson << ": " << total << '\n';
    return 0;
}
