// Tuần 04 · Bài 18: Sanitizer build flags.
// Ví dụ C++17 phòng thủ: container tự quản lý bộ nhớ và kiểm tra biên.
#include <array>
#include <iostream>
#include <string>

int main() {
    const std::array<int, 3> scores{18, 28, 38};
    const std::string lesson = "Sanitizer build flags";
    int total = 0;
    for (std::size_t i = 0; i < scores.size(); ++i) total += scores.at(i);
    std::cout << "18 - " << lesson << ": " << total << '\n';
    return 0;
}
