// Tuần 03 · Bài 13: unique ptr.
// Ví dụ C++17 phòng thủ: container tự quản lý bộ nhớ và kiểm tra biên.
#include <array>
#include <iostream>
#include <string>

int main() {
    const std::array<int, 3> scores{13, 23, 33};
    const std::string lesson = "unique ptr";
    int total = 0;
    for (std::size_t i = 0; i < scores.size(); ++i) total += scores.at(i);
    std::cout << "13 - " << lesson << ": " << total << '\n';
    return 0;
}
