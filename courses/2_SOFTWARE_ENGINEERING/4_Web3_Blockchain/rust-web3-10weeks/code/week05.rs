// Tuần 5: Cấu trúc Anchor
// Chạy: rustc code/week05.rs -o /tmp/web3-week05 && /tmp/web3-week05
#[derive(Debug)] enum ProgramError { Unauthorized, InvalidAmount }
struct State { authority: String, value: u64 }
fn update(s: &mut State, signer: &str, amount: u64) -> Result<(), ProgramError> {
    if s.authority != signer { return Err(ProgramError::Unauthorized); }
    if amount == 0 { return Err(ProgramError::InvalidAmount); }
    s.value = amount; Ok(())
}
fn main() { let mut s=State{authority:"alice".into(),value:0}; println!("{:?}", update(&mut s,"alice",7)); }
