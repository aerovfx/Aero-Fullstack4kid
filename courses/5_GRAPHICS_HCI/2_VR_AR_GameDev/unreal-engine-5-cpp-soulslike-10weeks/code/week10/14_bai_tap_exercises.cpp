// unreal-engine-5-cpp-soulslike-10weeks · Tuần 10 · Bài 14: Bài Tập / Exercises.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{14, 15, 16};
    int total = 0; for (const int value : values) total += value;
    std::cout << "14 - Bài Tập / Exercises: " << total << '\n';
}
