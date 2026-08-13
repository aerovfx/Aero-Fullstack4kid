// Tuần 8: Testing và Clippy
fn add_stock(current:i32,amount:i32)->i32{if amount>0{current+amount}else{current}} fn main(){assert_eq!(add_stock(3,2),5);assert_eq!(add_stock(3,-1),3);println!("2 test đạt");}
