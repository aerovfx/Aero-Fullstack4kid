// cpp-modern-10weeks · Tuần 01 · Bài 04: code minh họa của tuần.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{4, 5, 6};
    int total = 0; for (const int value : values) total += value;
    std::cout << "04 - code minh họa của tuần: " << total << '\n';
}
