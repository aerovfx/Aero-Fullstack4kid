// unreal-engine-5-cpp-soulslike-10weeks · Tuần 01 · Bài 03: Dữ liệu chiến đấu.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{3, 4, 5};
    int total = 0; for (const int value : values) total += value;
    std::cout << "03 - Dữ liệu chiến đấu: " << total << '\n';
}
