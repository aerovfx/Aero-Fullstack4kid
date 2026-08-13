// cpp-modern-10weeks · Tuần 03 · Bài 19: Thực hành có hướng dẫn tuần 03.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{19, 20, 21};
    int total = 0; for (const int value : values) total += value;
    std::cout << "19 - Thực hành có hướng dẫn tuần 03: " << total << '\n';
}
