// Tuần 2: Mô hình Account
// Chạy: rustc code/week02.rs -o /tmp/web3-week02 && /tmp/web3-week02
#[derive(Debug)] struct Account<'a> { owner: &'a str, signer: bool, writable: bool }
fn validate(a: &Account, program: &str) -> Result<(), &'static str> {
    if a.owner != program { return Err("sai owner"); }
    if !a.signer || !a.writable { return Err("thieu quyen"); }
    Ok(())
}
fn main() { println!("{:?}", validate(&Account { owner:"demo", signer:true, writable:true }, "demo")); }
