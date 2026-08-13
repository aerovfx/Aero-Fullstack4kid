// Tuần 8: Xử lý lỗi
#include <charconv>
#include <iostream>
#include <optional>
std::optional<int> parse(const char* s){int v{}; auto [p,e]=std::from_chars(s,s+2,v); return e==std::errc{}?std::optional{v}:std::nullopt;} int main(){std::cout<<parse("42").value_or(-1)<<'\n';}
