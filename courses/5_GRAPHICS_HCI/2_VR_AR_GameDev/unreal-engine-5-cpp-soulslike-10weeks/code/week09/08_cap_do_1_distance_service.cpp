// unreal-engine-5-cpp-soulslike-10weeks · Tuần 09 · Bài 08: Cấp độ 1: Distance Service.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{8, 9, 10};
    int total = 0; for (const int value : values) total += value;
    std::cout << "08 - Cấp độ 1: Distance Service: " << total << '\n';
}
