// unreal-engine-5-cpp-soulslike-10weeks · Tuần 01 · Bài 11: Bài Tập & Bài Về Nhà / Exercises & Homework.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{11, 12, 13};
    int total = 0; for (const int value : values) total += value;
    std::cout << "11 - Bài Tập & Bài Về Nhà / Exercises & Homework: " << total << '\n';
}
