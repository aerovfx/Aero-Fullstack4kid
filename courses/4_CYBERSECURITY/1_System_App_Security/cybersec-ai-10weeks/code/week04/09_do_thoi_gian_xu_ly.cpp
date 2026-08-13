// Tuần 04 · Bài 09: Đo thời gian xử lý.
// Ví dụ C++17 phòng thủ: container tự quản lý bộ nhớ và kiểm tra biên.
#include <array>
#include <iostream>
#include <string>

int main() {
    const std::array<int, 3> scores{9, 19, 29};
    const std::string lesson = "Đo thời gian xử lý";
    int total = 0;
    for (std::size_t i = 0; i < scores.size(); ++i) total += scores.at(i);
    std::cout << "09 - " << lesson << ": " << total << '\n';
    return 0;
}
