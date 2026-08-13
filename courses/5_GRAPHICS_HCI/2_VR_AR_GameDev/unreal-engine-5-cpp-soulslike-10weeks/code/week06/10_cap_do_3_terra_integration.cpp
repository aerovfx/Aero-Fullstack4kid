// unreal-engine-5-cpp-soulslike-10weeks · Tuần 06 · Bài 10: Cấp độ 3: Terra integration.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{10, 11, 12};
    int total = 0; for (const int value : values) total += value;
    std::cout << "10 - Cấp độ 3: Terra integration: " << total << '\n';
}
