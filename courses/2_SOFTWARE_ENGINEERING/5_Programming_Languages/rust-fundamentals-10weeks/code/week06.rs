// Tuần 6: Result và lỗi
fn divide(a:i32,b:i32)->Result<i32,String>{if b==0{Err("không chia cho 0".into())}else{Ok(a/b)}} fn main(){println!("{:?}",divide(8,2));}
