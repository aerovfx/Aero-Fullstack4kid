// Tuần 9: Testing, CMake, sanitizer
#include <cassert>
int add_stock(int current,int amount){return amount>0?current+amount:current;} int main(){assert(add_stock(3,2)==5);assert(add_stock(3,-1)==3);}
