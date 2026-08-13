// Tuần 3: Anchor cơ bản
// Chạy: rustc code/week03.rs -o /tmp/web3-week03 && /tmp/web3-week03
struct Context<'a> { authority: &'a str, signer: &'a str }
fn initialize(ctx: &Context) -> Result<u64, &'static str> {
    if ctx.authority != ctx.signer { return Err("constraint signer"); }
    Ok(0)
}
fn main() { println!("{:?}", initialize(&Context { authority:"alice", signer:"alice" })); }
