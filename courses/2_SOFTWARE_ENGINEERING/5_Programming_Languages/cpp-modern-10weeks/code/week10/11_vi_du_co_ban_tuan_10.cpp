// cpp-modern-10weeks · Tuần 10 · Bài 11: Ví dụ cơ bản tuần 10.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{11, 12, 13};
    int total = 0; for (const int value : values) total += value;
    std::cout << "11 - Ví dụ cơ bản tuần 10: " << total << '\n';
}
