use axum::{routing::get, Json, Router};
use serde_json::{json, Value};

// Handler trả Json để Axum tự đặt Content-Type và serialize response.
async fn health() -> Json<Value> {
    Json(json!({ "status": "ok" }))
}

#[tokio::main]
async fn main() {
    // Router ánh xạ GET /health tới handler health.
    let app = Router::new().route("/health", get(health));
    // Chỉ bind localhost để phù hợp môi trường học tập cục bộ.
    let listener = tokio::net::TcpListener::bind("127.0.0.1:3000")
        .await
        .unwrap();
    println!("GET http://127.0.0.1:3000/health");
    // Server nhận request và chuyển cho Router xử lý.
    axum::serve(listener, app).await.unwrap();
}
