// Tuần 9: Kiểm thử program
// Chạy: rustc code/week09.rs -o /tmp/web3-week09 && /tmp/web3-week09
fn increment(value:u64, amount:u64)->Result<u64,&'static str>{ value.checked_add(amount).ok_or("overflow") }
fn main(){
    assert_eq!(increment(1,2),Ok(3));
    assert!(increment(u64::MAX,1).is_err());
    assert_eq!(increment(7,0),Ok(7));
    println!("3 ca kiem thu dat");
}
