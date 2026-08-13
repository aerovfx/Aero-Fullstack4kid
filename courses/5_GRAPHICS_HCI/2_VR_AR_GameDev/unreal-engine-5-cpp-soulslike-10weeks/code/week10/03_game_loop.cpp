// unreal-engine-5-cpp-soulslike-10weeks · Tuần 10 · Bài 03: Game loop.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{3, 4, 5};
    int total = 0; for (const int value : values) total += value;
    std::cout << "03 - Game loop: " << total << '\n';
}
