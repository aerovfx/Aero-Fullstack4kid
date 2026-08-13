// Tuần 9: Thread và channel
use std::sync::mpsc;use std::thread;fn main(){let(tx,rx)=mpsc::channel();thread::spawn(move||tx.send(42).unwrap());println!("{}",rx.recv().unwrap());}
