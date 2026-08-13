use sqlx::{FromRow, SqlitePool};

// FromRow cho phép SQLx ánh xạ từng hàng truy vấn vào struct.
#[derive(Debug, FromRow)]
struct User {
    id: i64,
    name: String,
}

#[tokio::main]
async fn main() -> Result<(), sqlx::Error> {
    // Database trong RAM phù hợp demo/test và biến mất khi chương trình kết thúc.
    let pool = SqlitePool::connect("sqlite::memory:").await?;

    // execute dùng cho lệnh không cần trả danh sách bản ghi.
    sqlx::query("CREATE TABLE users (id INTEGER PRIMARY KEY, name TEXT NOT NULL)")
        .execute(&pool)
        .await?;
    // bind truyền tham số an toàn, không nối chuỗi SQL từ dữ liệu người dùng.
    sqlx::query("INSERT INTO users(name) VALUES (?)")
        .bind("An")
        .execute(&pool)
        .await?;
    // query_as ánh xạ kết quả SELECT sang Vec<User>.
    let users: Vec<User> = sqlx::query_as("SELECT id, name FROM users")
        .fetch_all(&pool)
        .await?;
    for user in users {
        println!("#{} {}", user.id, user.name);
    }
    Ok(())
}
