// Tuần 7: SPL Token
// Chạy: rustc code/week07.rs -o /tmp/web3-week07 && /tmp/web3-week07
use std::collections::HashMap;
fn transfer(b: &mut HashMap<String,u64>, from:&str, to:&str, amount:u64) -> Result<(), &'static str> {
    let source=*b.get(from).unwrap_or(&0);
    if amount==0 || source<amount { return Err("so du khong du"); }
    b.insert(from.to_owned(),source-amount); *b.entry(to.to_owned()).or_insert(0)+=amount; Ok(())
}
fn main(){ let mut b=HashMap::from([("alice".to_owned(),10)]); transfer(&mut b,"alice","bob",3).unwrap(); println!("{b:?}"); }
