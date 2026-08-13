use axum::{
    extract::Path,
    http::StatusCode,
    routing::{get, post},
    Json, Router,
};
use serde::{Deserialize, Serialize};

// Deserialize chuyển JSON request thành struct Rust.
#[derive(Deserialize)]
struct CreateUser {
    name: String,
}
// Serialize chuyển struct Rust thành JSON response.
#[derive(Serialize)]
struct User {
    id: u64,
    name: String,
}

// Path extractor lấy {id} từ URL và kiểm tra kiểu u64.
async fn find_user(Path(id): Path<u64>) -> Json<User> {
    Json(User {
        id,
        name: "Demo".into(),
    })
}
// Json extractor parse body; tuple đặt status 201 cho response.
async fn create_user(Json(input): Json<CreateUser>) -> (StatusCode, Json<User>) {
    (
        StatusCode::CREATED,
        Json(User {
            id: 1,
            name: input.name,
        }),
    )
}

#[tokio::main]
async fn main() {
    // Cùng resource /users nhưng dùng method khác nhau cho đọc và tạo.
    let app = Router::new()
        .route("/users/{id}", get(find_user))
        .route("/users", post(create_user));
    let listener = tokio::net::TcpListener::bind("127.0.0.1:3000")
        .await
        .unwrap();
    axum::serve(listener, app).await.unwrap();
}
