// unreal-engine-5-cpp-soulslike-10weeks · Tuần 08 · Bài 20: Hiểu Lầm Thường Gặp / Common Misconceptions.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{20, 21, 22};
    int total = 0; for (const int value : values) total += value;
    std::cout << "20 - Hiểu Lầm Thường Gặp / Common Misconceptions: " << total << '\n';
}
