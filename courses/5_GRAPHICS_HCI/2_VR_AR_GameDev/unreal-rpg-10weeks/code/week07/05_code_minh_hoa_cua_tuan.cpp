// unreal-rpg-10weeks · Tuần 07 · Bài 05: code minh họa của tuần.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{5, 6, 7};
    int total = 0; for (const int value : values) total += value;
    std::cout << "05 - code minh họa của tuần: " << total << '\n';
}
