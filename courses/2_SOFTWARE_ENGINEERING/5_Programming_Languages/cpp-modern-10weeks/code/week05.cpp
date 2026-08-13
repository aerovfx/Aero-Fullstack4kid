// Tuần 5: Smart pointer
#include <iostream>
#include <memory>
struct Node{int value;}; int main(){auto node=std::make_unique<Node>(Node{7}); std::cout<<node->value<<'\n';}
