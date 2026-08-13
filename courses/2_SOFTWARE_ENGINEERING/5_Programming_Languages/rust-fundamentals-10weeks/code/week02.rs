// Tuần 2: Ownership và move
fn length(text:String)->(String,usize){let n=text.len();(text,n)} fn main(){let(t,n)=length("Rust".into());println!("{t}: {n}");}
