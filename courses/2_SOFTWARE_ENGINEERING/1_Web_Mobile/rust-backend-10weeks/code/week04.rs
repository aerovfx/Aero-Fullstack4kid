use std::fmt::Display;
use std::rc::Rc;

// Trait mô tả hành vi chung mà nhiều kiểu dữ liệu có thể triển khai.
trait Summary {
    fn summary(&self) -> String;
}
// Blanket implementation: mọi kiểu có Display đều tự có Summary.
impl<T: Display> Summary for T {
    fn summary(&self) -> String {
        format!("value={self}")
    }
}

// Generic T chỉ cần hỗ trợ so sánh PartialOrd.
fn largest<T: PartialOrd>(items: &[T]) -> &T {
    let mut largest = &items[0];
    for item in &items[1..] {
        if item > largest {
            largest = item;
        }
    }
    largest
}

fn main() {
    // Rc cho phép nhiều owner cùng chia sẻ dữ liệu trong một luồng.
    let shared = Rc::new(vec![3, 8, 2, 5]);
    // Rc::clone chỉ tăng bộ đếm tham chiếu, không sao chép cả Vec.
    let reader = Rc::clone(&shared);
    println!(
        "{}, owners={}",
        largest(&reader).summary(),
        Rc::strong_count(&shared)
    );
}
