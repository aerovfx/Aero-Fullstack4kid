// unreal-engine-5-cpp-soulslike-10weeks · Tuần 08 · Bài 11: Code 1 — Khái niệm nhỏ: chọn điểm patrol reachable.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{11, 12, 13};
    int total = 0; for (const int value : values) total += value;
    std::cout << "11 - Code 1 — Khái niệm nhỏ: chọn điểm patrol reachable: " << total << '\n';
}
