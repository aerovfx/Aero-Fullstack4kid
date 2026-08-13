// unreal-engine-5-cpp-soulslike-10weeks · Tuần 10 · Bài 19: Câu Hỏi Thảo Luận / Discussion Questions.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{19, 20, 21};
    int total = 0; for (const int value : values) total += value;
    std::cout << "19 - Câu Hỏi Thảo Luận / Discussion Questions: " << total << '\n';
}
