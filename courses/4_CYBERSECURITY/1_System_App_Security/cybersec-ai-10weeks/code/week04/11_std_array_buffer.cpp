// Tuần 04 · Bài 11: std array buffer.
// Ví dụ C++17 phòng thủ: container tự quản lý bộ nhớ và kiểm tra biên.
#include <array>
#include <iostream>
#include <string>

int main() {
    const std::array<int, 3> scores{11, 21, 31};
    const std::string lesson = "std array buffer";
    int total = 0;
    for (std::size_t i = 0; i < scores.size(); ++i) total += scores.at(i);
    std::cout << "11 - " << lesson << ": " << total << '\n';
    return 0;
}
