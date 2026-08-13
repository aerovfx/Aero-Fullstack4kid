// Tuần 04 · Bài 10: Thu thập kết quả song song.
// Ví dụ C++17 phòng thủ: container tự quản lý bộ nhớ và kiểm tra biên.
#include <array>
#include <iostream>
#include <string>

int main() {
    const std::array<int, 3> scores{10, 20, 30};
    const std::string lesson = "Thu thập kết quả song song";
    int total = 0;
    for (std::size_t i = 0; i < scores.size(); ++i) total += scores.at(i);
    std::cout << "10 - " << lesson << ": " << total << '\n';
    return 0;
}
