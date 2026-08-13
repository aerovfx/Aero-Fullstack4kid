// Tuần 2: Điều khiển và STL
#include <iostream>
#include <vector>
int main(){ std::vector<int> scores{7,9,8}; int sum{}; for(int x:scores) sum+=x; std::cout << sum/scores.size() << '\n'; }
