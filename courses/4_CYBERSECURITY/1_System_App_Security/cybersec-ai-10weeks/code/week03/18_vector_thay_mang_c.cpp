// Tuần 03 · Bài 18: Vector thay mảng C.
// Ví dụ C++17 phòng thủ: container tự quản lý bộ nhớ và kiểm tra biên.
#include <array>
#include <iostream>
#include <string>

int main() {
    const std::array<int, 3> scores{18, 28, 38};
    const std::string lesson = "Vector thay mảng C";
    int total = 0;
    for (std::size_t i = 0; i < scores.size(); ++i) total += scores.at(i);
    std::cout << "18 - " << lesson << ": " << total << '\n';
    return 0;
}
