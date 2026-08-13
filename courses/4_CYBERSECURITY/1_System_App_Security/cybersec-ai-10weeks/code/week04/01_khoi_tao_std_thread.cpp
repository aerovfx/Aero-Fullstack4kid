// Tuần 04 · Bài 01: Khởi tạo std thread.
// Ví dụ C++17 phòng thủ: container tự quản lý bộ nhớ và kiểm tra biên.
#include <array>
#include <iostream>
#include <string>

int main() {
    const std::array<int, 3> scores{1, 11, 21};
    const std::string lesson = "Khởi tạo std thread";
    int total = 0;
    for (std::size_t i = 0; i < scores.size(); ++i) total += scores.at(i);
    std::cout << "01 - " << lesson << ": " << total << '\n';
    return 0;
}
