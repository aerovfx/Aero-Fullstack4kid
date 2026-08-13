// unreal-engine-5-cpp-soulslike-10weeks · Tuần 03 · Bài 19: Checklist.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{19, 20, 21};
    int total = 0; for (const int value : values) total += value;
    std::cout << "19 - Checklist: " << total << '\n';
}
