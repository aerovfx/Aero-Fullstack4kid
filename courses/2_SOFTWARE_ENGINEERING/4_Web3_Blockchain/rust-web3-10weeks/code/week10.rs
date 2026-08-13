// Tuần 10: Tích hợp DApp
// Chạy: rustc code/week10.rs -o /tmp/web3-week10 && /tmp/web3-week10
#[derive(Debug)] struct WalletRequest { program:String, signer:String, instruction:String }
fn build_request(program:&str, signer:&str)->Result<WalletRequest,&'static str>{
    if program.is_empty() || signer.is_empty(){return Err("chua ket noi vi");}
    Ok(WalletRequest{program:program.into(),signer:signer.into(),instruction:"increment".into()})
}
fn main(){ let r=build_request("Counter111","alice").unwrap(); println!("{} {} {}",r.program,r.signer,r.instruction); }
