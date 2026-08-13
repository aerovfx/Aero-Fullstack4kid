// Struct gom các trường liên quan thành một kiểu dữ liệu nghiệp vụ.
#[derive(Debug)]
struct User {
    id: u64,
    name: String,
    role: Role,
}

// Enum giới hạn role vào các trạng thái hợp lệ đã định nghĩa.
#[derive(Debug)]
enum Role {
    Admin,
    Member,
}

impl User {
    // `matches!` kiểm tra pattern ngắn gọn mà không cần match đầy đủ.
    fn can_delete(&self) -> bool {
        matches!(self.role, Role::Admin)
    }
    // `&self` chỉ mượn User, không tiêu thụ đối tượng.
    fn summary(&self) -> String {
        format!("#{} {} ({:?})", self.id, self.name, self.role)
    }
}

fn main() {
    // Mảng có kích thước cố định và các phần tử cùng kiểu User.
    let users = [
        User {
            id: 1,
            name: "An".into(),
            role: Role::Admin,
        },
        User {
            id: 2,
            name: "Binh".into(),
            role: Role::Member,
        },
    ];
    for user in users {
        println!("{} delete={}", user.summary(), user.can_delete());
    }
}
