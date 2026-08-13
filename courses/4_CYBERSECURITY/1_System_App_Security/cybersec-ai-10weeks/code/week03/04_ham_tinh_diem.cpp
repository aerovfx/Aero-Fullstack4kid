// Tuần 03 · Bài 04: Hàm tính điểm.
// Ví dụ C++17 phòng thủ: container tự quản lý bộ nhớ và kiểm tra biên.
#include <array>
#include <iostream>
#include <string>

int main() {
    const std::array<int, 3> scores{4, 14, 24};
    const std::string lesson = "Hàm tính điểm";
    int total = 0;
    for (std::size_t i = 0; i < scores.size(); ++i) total += scores.at(i);
    std::cout << "04 - " << lesson << ": " << total << '\n';
    return 0;
}
