// unreal-engine-5-cpp-soulslike-10weeks · Tuần 07 · Bài 12: Code 2 — Ví dụ trung gian: stamina regen bằng timer.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{12, 13, 14};
    int total = 0; for (const int value : values) total += value;
    std::cout << "12 - Code 2 — Ví dụ trung gian: stamina regen bằng timer: " << total << '\n';
}
