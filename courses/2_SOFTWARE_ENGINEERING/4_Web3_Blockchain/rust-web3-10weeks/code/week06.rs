// Tuần 6: State account và PDA
// Chạy: rustc code/week06.rs -o /tmp/web3-week06 && /tmp/web3-week06
fn pda_seed(owner: &str, label: &str) -> Result<String, &'static str> {
    if owner.is_empty() || label.len() > 32 { return Err("seed khong hop le"); }
    Ok(format!("profile:{owner}:{label}"))
}
fn main() { println!("{}", pda_seed("alice", "main").unwrap()); }
