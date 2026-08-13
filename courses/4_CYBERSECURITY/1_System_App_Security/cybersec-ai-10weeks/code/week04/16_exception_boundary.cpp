// Tuần 04 · Bài 16: Exception boundary.
// Ví dụ C++17 phòng thủ: container tự quản lý bộ nhớ và kiểm tra biên.
#include <array>
#include <iostream>
#include <string>

int main() {
    const std::array<int, 3> scores{16, 26, 36};
    const std::string lesson = "Exception boundary";
    int total = 0;
    for (std::size_t i = 0; i < scores.size(); ++i) total += scores.at(i);
    std::cout << "16 - " << lesson << ": " << total << '\n';
    return 0;
}
