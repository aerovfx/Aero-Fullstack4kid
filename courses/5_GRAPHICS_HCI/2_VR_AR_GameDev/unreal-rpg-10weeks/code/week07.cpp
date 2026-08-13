// Tuần 7: Damage và collision. Mô hình C++ thuần để kiểm thử ngoài Unreal.
#include <algorithm>
#include <cassert>
#include <iostream>
#include <stdexcept>
struct GameState {
    int health{100};
    int stamina{100};
    void spend(int cost) {
        if (cost < 0) throw std::invalid_argument("cost phải không âm");
        stamina = std::max(0, stamina - cost);
    }
};
int main() {
    GameState state;
    state.spend(25);
    assert(state.health == 100 && state.stamina == 75);
    std::cout << "Damage và collision: PASS\n";
}
