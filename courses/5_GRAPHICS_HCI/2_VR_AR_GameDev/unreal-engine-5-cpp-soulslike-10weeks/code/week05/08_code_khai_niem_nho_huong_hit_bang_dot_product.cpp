// unreal-engine-5-cpp-soulslike-10weeks · Tuần 05 · Bài 08: Code khái niệm nhỏ — hướng hit bằng dot product.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{8, 9, 10};
    int total = 0; for (const int value : values) total += value;
    std::cout << "08 - Code khái niệm nhỏ — hướng hit bằng dot product: " << total << '\n';
}
