// unreal-engine-5-cpp-soulslike-10weeks · Tuần 05 · Bài 11: Cấp độ 3: Hit reaction.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{11, 12, 13};
    int total = 0; for (const int value : values) total += value;
    std::cout << "11 - Cấp độ 3: Hit reaction: " << total << '\n';
}
