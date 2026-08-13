// unreal-rpg-10weeks · Tuần 05 · Bài 12: Ví dụ cơ bản tuần 05.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{12, 13, 14};
    int total = 0; for (const int value : values) total += value;
    std::cout << "12 - Ví dụ cơ bản tuần 05: " << total << '\n';
}
