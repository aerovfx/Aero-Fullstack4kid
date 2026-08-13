// Tuần 10: Concurrency và CLI
#include <future>
#include <iostream>
int main(){auto result=std::async(std::launch::async,[]{return 6*7;});std::cout<<result.get()<<'\n';}
