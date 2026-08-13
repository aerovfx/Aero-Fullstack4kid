// Tuần 1: SVM và xử lý song song
// Chạy: rustc code/week01.rs -o /tmp/web3-week01 && /tmp/web3-week01
use std::collections::HashSet;
fn can_run_parallel(a: &[&str], b: &[&str]) -> bool {
    let writes: HashSet<_> = a.iter().collect();
    b.iter().all(|account| !writes.contains(account))
}
fn main() {
    println!("song song: {}", can_run_parallel(&["alice"], &["bob"]));
}
