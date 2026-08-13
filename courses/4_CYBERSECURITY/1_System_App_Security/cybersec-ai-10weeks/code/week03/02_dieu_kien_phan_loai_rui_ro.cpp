// Tuần 03 · Bài 02: Điều kiện phân loại rủi ro.
// Ví dụ C++17 phòng thủ: container tự quản lý bộ nhớ và kiểm tra biên.
#include <array>
#include <iostream>
#include <string>

int main() {
    const std::array<int, 3> scores{2, 12, 22};
    const std::string lesson = "Điều kiện phân loại rủi ro";
    int total = 0;
    for (std::size_t i = 0; i < scores.size(); ++i) total += scores.at(i);
    std::cout << "02 - " << lesson << ": " << total << '\n';
    return 0;
}
