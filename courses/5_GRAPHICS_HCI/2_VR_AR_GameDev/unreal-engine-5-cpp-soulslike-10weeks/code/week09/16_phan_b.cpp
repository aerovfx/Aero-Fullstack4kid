// unreal-engine-5-cpp-soulslike-10weeks · Tuần 09 · Bài 16: 🟡 Phần B.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{16, 17, 18};
    int total = 0; for (const int value : values) total += value;
    std::cout << "16 - 🟡 Phần B: " << total << '\n';
}
