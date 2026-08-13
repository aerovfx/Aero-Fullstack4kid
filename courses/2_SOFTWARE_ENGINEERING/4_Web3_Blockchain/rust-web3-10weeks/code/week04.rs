// Tuần 4: Native Rust program
// Chạy: rustc code/week04.rs -o /tmp/web3-week04 && /tmp/web3-week04
fn process(counter: &mut u64, instruction: &[u8]) -> Result<(), &'static str> {
    let amount = *instruction.first().ok_or("instruction rong")? as u64;
    *counter = counter.checked_add(amount).ok_or("tran so")?;
    Ok(())
}
fn main() { let mut counter=1; process(&mut counter, &[2]).unwrap(); println!("{counter}"); }
