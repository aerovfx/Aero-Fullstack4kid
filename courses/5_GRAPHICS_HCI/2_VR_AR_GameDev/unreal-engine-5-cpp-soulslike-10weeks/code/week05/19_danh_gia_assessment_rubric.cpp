// unreal-engine-5-cpp-soulslike-10weeks · Tuần 05 · Bài 19: Đánh Giá / Assessment Rubric.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{19, 20, 21};
    int total = 0; for (const int value : values) total += value;
    std::cout << "19 - Đánh Giá / Assessment Rubric: " << total << '\n';
}
