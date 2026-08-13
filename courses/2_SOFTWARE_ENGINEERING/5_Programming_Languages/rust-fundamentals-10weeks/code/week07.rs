// Tuần 7: Generic, trait và module
trait Summary{fn summary(&self)->String;} impl Summary for &str{fn summary(&self)->String{self.to_uppercase()}} fn main(){println!("{}", "rust".summary());}
