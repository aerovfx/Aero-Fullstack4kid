// unreal-engine-5-cpp-soulslike-10weeks · Tuần 03 · Bài 07: Code khái niệm nhỏ — biến locomotion.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{7, 8, 9};
    int total = 0; for (const int value : values) total += value;
    std::cout << "07 - Code khái niệm nhỏ — biến locomotion: " << total << '\n';
}
