// unreal-engine-5-cpp-soulslike-10weeks · Tuần 07 · Bài 04: Event-driven UI.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{4, 5, 6};
    int total = 0; for (const int value : values) total += value;
    std::cout << "04 - Event-driven UI: " << total << '\n';
}
