// Tuần 4: RAII và lifetime
#include <fstream>
#include <iostream>
int main(){ std::ofstream out{"/tmp/cpp-week04.txt"}; if(!out) return 1; out<<"RAII tu dong dong file"; std::cout<<"da ghi\n"; }
