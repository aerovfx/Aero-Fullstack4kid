use tokio::time::{sleep, Duration};

// Hàm async trả về Future; công việc chỉ chạy khi Future được await.
async fn fetch(id: u8, milliseconds: u64) -> String {
    // sleep bất đồng bộ nhường runtime xử lý task khác thay vì chặn thread.
    sleep(Duration::from_millis(milliseconds)).await;
    format!("task {id} finished")
}

// Macro tạo Tokio runtime để có thể await ngay trong main.
#[tokio::main]
async fn main() {
    // join! chạy ba Future đồng thời và chờ tất cả hoàn thành.
    let (first, second, third) = tokio::join!(fetch(1, 120), fetch(2, 60), fetch(3, 90));
    println!("{first}\n{second}\n{third}");
}
