// Tuần 04 · Bài 20: Mini secure concurrent processor.
// Ví dụ C++17 phòng thủ: container tự quản lý bộ nhớ và kiểm tra biên.
#include <array>
#include <iostream>
#include <string>

int main() {
    const std::array<int, 3> scores{20, 30, 40};
    const std::string lesson = "Mini secure concurrent processor";
    int total = 0;
    for (std::size_t i = 0; i < scores.size(); ++i) total += scores.at(i);
    std::cout << "20 - " << lesson << ": " << total << '\n';
    return 0;
}
