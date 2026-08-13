// Tuần 10: CLI và persistence
use std::env;fn main(){let title=env::args().skip(1).collect::<Vec<_>>().join(" ");println!("{}",if title.is_empty(){"Cách dùng: week10 <task>"}else{&title});}
