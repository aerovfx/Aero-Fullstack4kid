// Lifetime `'a` nói rằng tham chiếu trả về còn hợp lệ không lâu hơn hai đầu vào.
fn longest<'a>(left: &'a str, right: &'a str) -> &'a str {
    if left.len() >= right.len() {
        left
    } else {
        right
    }
}

// `&str` là tham chiếu chỉ đọc; hàm không lấy ownership của chuỗi.
fn word_count(text: &str) -> usize {
    text.split_whitespace().count()
}

fn main() {
    // `owner` sở hữu vùng nhớ chứa String.
    let owner = String::from("Rust manages memory without a garbage collector");
    // `borrowed` chỉ mượn owner nên không làm owner mất hiệu lực.
    let borrowed = &owner;
    println!(
        "words={}, longest={}",
        word_count(borrowed),
        longest(borrowed, "Rust")
    );
    // Dòng này chứng minh owner vẫn dùng được sau khi cho mượn.
    println!("owner is still valid: {owner}");
}
