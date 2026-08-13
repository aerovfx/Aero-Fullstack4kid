// Tuần 5: Collection và iterator
use std::collections::HashMap; fn main(){let scores=HashMap::from([("An",8),("Bình",9)]);let avg:f64=scores.values().sum::<i32>() as f64/scores.len() as f64;println!("{avg}");}
