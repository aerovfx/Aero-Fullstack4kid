// rust-backend-10weeks · Tuần 02 · Bài 04: Tổng quan về Ownership, Borrowing & Lifetimes (Rust Theory).
fn main() {
    let values = [4, 5, 6];
    let total: i32 = values.iter().sum();
    println!("04 - Tổng quan về Ownership, Borrowing & Lifetimes (Rust Theory): {total}");
}
