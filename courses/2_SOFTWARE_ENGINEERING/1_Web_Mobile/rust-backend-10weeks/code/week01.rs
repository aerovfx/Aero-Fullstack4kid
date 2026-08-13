// Nhận một lát cắt (slice) để hàm chỉ mượn dữ liệu, không chiếm quyền sở hữu Vec.
fn statistics(values: &[i32]) -> (i32, f64) {
    // Iterator giúp cộng toàn bộ phần tử mà không cần quản lý chỉ số thủ công.
    let total: i32 = values.iter().sum();
    (total, total as f64 / values.len() as f64)
}

fn main() {
    // `mut` cho phép thay đổi Vec sau khi khởi tạo.
    let mut scores = vec![7, 8, 9];
    scores.push(10);

    // Destructuring tách tuple trả về thành hai biến.
    let (total, average) = statistics(&scores);
    println!("scores={scores:?}, total={total}, average={average:.2}");
}
