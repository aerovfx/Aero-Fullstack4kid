// Tuần 04 · Bài 14: std span tư duy giới hạn.
// Ví dụ C++17 phòng thủ: container tự quản lý bộ nhớ và kiểm tra biên.
#include <array>
#include <iostream>
#include <string>

int main() {
    const std::array<int, 3> scores{14, 24, 34};
    const std::string lesson = "std span tư duy giới hạn";
    int total = 0;
    for (std::size_t i = 0; i < scores.size(); ++i) total += scores.at(i);
    std::cout << "14 - " << lesson << ": " << total << '\n';
    return 0;
}
