// unreal-rpg-10weeks · Tuần 08 · Bài 16: Tách hàm tuần 08.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{16, 17, 18};
    int total = 0; for (const int value : values) total += value;
    std::cout << "16 - Tách hàm tuần 08: " << total << '\n';
}
