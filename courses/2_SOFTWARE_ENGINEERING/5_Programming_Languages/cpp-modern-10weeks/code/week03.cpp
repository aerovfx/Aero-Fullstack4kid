// Tuần 3: Class và value semantics
#include <iostream>
#include <string>
class Product{std::string name_; int quantity_; public: Product(std::string n,int q):name_(std::move(n)),quantity_(q){} void print()const{std::cout<<name_<<": "<<quantity_<<'\n';}};
int main(){Product{"Mouse",4}.print();}
