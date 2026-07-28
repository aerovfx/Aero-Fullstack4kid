use std::env;

#[derive(Debug, PartialEq)]
struct Task {
    title: String,
    done: bool,
}

impl Task {
    fn new(title: &str) -> Result<Self, String> {
        let title = title.trim();
        if title.is_empty() {
            return Err("Tên công việc không được để trống".to_string());
        }
        Ok(Self { title: title.to_string(), done: false })
    }

    fn complete(&mut self) {
        self.done = true;
    }
}

fn main() {
    let title = env::args().skip(1).collect::<Vec<_>>().join(" ");
    match Task::new(&title) {
        Ok(mut task) => {
            println!("Đã tạo: {}", task.title);
            task.complete();
            println!("Trạng thái: {}", if task.done { "hoàn thành" } else { "đang làm" });
        }
        Err(message) => eprintln!("Lỗi: {message}\nCách dùng: task_cli <tên công việc>"),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn rejects_blank_title() {
        assert_eq!(Task::new("   "), Err("Tên công việc không được để trống".to_string()));
    }

    #[test]
    fn completes_task() {
        let mut task = Task::new("Học borrowing").expect("valid title");
        task.complete();
        assert!(task.done);
    }
}

