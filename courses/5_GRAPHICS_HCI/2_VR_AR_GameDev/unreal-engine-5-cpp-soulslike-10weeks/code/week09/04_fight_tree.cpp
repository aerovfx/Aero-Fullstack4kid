// unreal-engine-5-cpp-soulslike-10weeks · Tuần 09 · Bài 04: Fight tree.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{4, 5, 6};
    int total = 0; for (const int value : values) total += value;
    std::cout << "04 - Fight tree: " << total << '\n';
}
