// Tuần 04 · Bài 07: Thread safe queue.
// Ví dụ C++17 phòng thủ: container tự quản lý bộ nhớ và kiểm tra biên.
#include <array>
#include <iostream>
#include <string>

int main() {
    const std::array<int, 3> scores{7, 17, 27};
    const std::string lesson = "Thread safe queue";
    int total = 0;
    for (std::size_t i = 0; i < scores.size(); ++i) total += scores.at(i);
    std::cout << "07 - " << lesson << ": " << total << '\n';
    return 0;
}
