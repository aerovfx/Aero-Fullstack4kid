// Tuần 03 · Bài 19: Bound checking với at.
// Ví dụ C++17 phòng thủ: container tự quản lý bộ nhớ và kiểm tra biên.
#include <array>
#include <iostream>
#include <string>

int main() {
    const std::array<int, 3> scores{19, 29, 39};
    const std::string lesson = "Bound checking với at";
    int total = 0;
    for (std::size_t i = 0; i < scores.size(); ++i) total += scores.at(i);
    std::cout << "19 - " << lesson << ": " << total << '\n';
    return 0;
}
