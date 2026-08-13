// Tuần 4: Struct, enum và match
#[derive(Debug)] enum Status{Todo,Done} struct Task{title:String,status:Status} fn main(){let mut t=Task{title:"Học match".into(),status:Status::Todo};t.status=match t.status{Status::Todo=>Status::Done,Status::Done=>Status::Done};println!("{} {:?}",t.title,t.status);}
