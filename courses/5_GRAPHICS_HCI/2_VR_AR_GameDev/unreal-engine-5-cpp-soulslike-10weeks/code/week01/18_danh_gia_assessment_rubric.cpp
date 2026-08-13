// unreal-engine-5-cpp-soulslike-10weeks · Tuần 01 · Bài 18: Đánh Giá / Assessment Rubric.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{18, 19, 20};
    int total = 0; for (const int value : values) total += value;
    std::cout << "18 - Đánh Giá / Assessment Rubric: " << total << '\n';
}
