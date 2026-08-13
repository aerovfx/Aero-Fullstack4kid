// unreal-engine-5-cpp-soulslike-10weeks · Tuần 02 · Bài 17: Câu Hỏi Thảo Luận / Discussion Questions.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{17, 18, 19};
    int total = 0; for (const int value : values) total += value;
    std::cout << "17 - Câu Hỏi Thảo Luận / Discussion Questions: " << total << '\n';
}
