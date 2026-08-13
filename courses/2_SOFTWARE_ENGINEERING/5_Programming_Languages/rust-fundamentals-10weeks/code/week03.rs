// Tuần 3: Borrowing và slice
fn words(s:&str)->usize{s.split_whitespace().count()} fn main(){let s=String::from("học Rust an toàn");println!("{}",words(&s));}
