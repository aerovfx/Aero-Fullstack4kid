#include <algorithm>
#include <iostream>
#include <stdexcept>
#include <string>
#include <utility>
#include <vector>

class Product {
public:
    Product(std::string name, int quantity) : name_(std::move(name)), quantity_(quantity) {
        if (name_.empty()) throw std::invalid_argument("product name cannot be empty");
        if (quantity_ < 0) throw std::invalid_argument("quantity cannot be negative");
    }

    void add_stock(int amount) {
        if (amount <= 0) throw std::invalid_argument("amount must be positive");
        quantity_ += amount;
    }

    [[nodiscard]] const std::string& name() const noexcept { return name_; }
    [[nodiscard]] int quantity() const noexcept { return quantity_; }

private:
    std::string name_;
    int quantity_;
};

int main() {
    std::vector<Product> inventory;
    inventory.emplace_back("Keyboard", 3);
    inventory.emplace_back("Mouse", 8);

    std::ranges::sort(inventory, {}, &Product::quantity);
    for (const auto& product : inventory) {
        std::cout << product.name() << ": " << product.quantity() << '\n';
    }
}
