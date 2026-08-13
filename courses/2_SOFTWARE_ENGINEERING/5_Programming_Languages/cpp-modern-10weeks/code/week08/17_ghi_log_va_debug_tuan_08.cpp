// cpp-modern-10weeks · Tuần 08 · Bài 17: Ghi log và debug tuần 08.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{17, 18, 19};
    int total = 0; for (const int value : values) total += value;
    std::cout << "17 - Ghi log và debug tuần 08: " << total << '\n';
}
