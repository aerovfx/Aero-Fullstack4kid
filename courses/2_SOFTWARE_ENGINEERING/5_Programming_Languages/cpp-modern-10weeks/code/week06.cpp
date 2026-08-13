// Tuần 6: Algorithm và lambda
#include <algorithm>
#include <iostream>
#include <vector>
int main(){std::vector<int> v{3,1,2}; std::ranges::sort(v); std::ranges::for_each(v,[](int x){std::cout<<x<<' ';});}
