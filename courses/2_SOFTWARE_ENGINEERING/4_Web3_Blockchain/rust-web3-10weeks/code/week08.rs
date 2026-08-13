// Tuần 8: Bảo mật Solana
// Chạy: rustc code/week08.rs -o /tmp/web3-week08 && /tmp/web3-week08
fn withdraw(owner:&str, signer:&str, balance:u64, amount:u64)->Result<u64,&'static str>{
    if owner!=signer { return Err("sai signer"); }
    balance.checked_sub(amount).ok_or("so du khong du")
}
fn main(){ println!("{:?}", withdraw("alice","alice",10,4)); }
