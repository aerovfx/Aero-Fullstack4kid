// Tuần 7: Template và concept
#include <concepts>
#include <iostream>
template<std::integral T> T twice(T x){return x+x;} int main(){std::cout<<twice(4)<<'\n';}
