#include <iostream>

using namespace std;

void stackDemo() {
    int stackVar = 100;
    cout << "[STACK] Biến stackVar = " << stackVar << " tại địa chỉ: " << &stackVar << endl;
    // Biến stackVar tự động giải phóng khi rời khỏi hàm này
}

void heapDemo() {
    // Cấp phát động 1 phần tử trên Heap
    int* heapPtr = new int;
    *heapPtr = 555;
    
    cout << "[HEAP] Biến *heapPtr = " << *heapPtr << " tại địa chỉ Heap: " << heapPtr << endl;
    cout << "[HEAP] Địa chỉ bản thân con trỏ heapPtr (nằm trên Stack): " << &heapPtr << endl;

    // PHẢI giải phóng thủ công bộ nhớ Heap
    delete heapPtr;
    heapPtr = nullptr; // Tránh Dangling Pointer
}

int main() {
    cout << "=== PHÂN BIỆT BỘ NHỚ STACK VÀ HEAP ===" << endl;
    stackDemo();
    heapDemo();
    return 0;
}
