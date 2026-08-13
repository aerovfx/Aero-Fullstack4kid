// Tuần 03 · Bài 05: std array cố định.
// Ví dụ C++17 phòng thủ: container tự quản lý bộ nhớ và kiểm tra biên.
#include <array>
#include <iostream>
#include <string>

int main() {
    const std::array<int, 3> scores{5, 15, 25};
    const std::string lesson = "std array cố định";
    int total = 0;
    for (std::size_t i = 0; i < scores.size(); ++i) total += scores.at(i);
    std::cout << "05 - " << lesson << ": " << total << '\n';
    return 0;
}
