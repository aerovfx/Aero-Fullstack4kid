use axum::{body::Body, http::Request, response::Response, routing::get, Router};
use tower::ServiceExt;

// Tách Router thành hàm giúp production và test dùng chung cấu hình.
fn app() -> Router {
    Router::new().route("/health", get(|| async { "ok" }))
}

// oneshot gửi request trực tiếp vào service, không cần mở cổng mạng thật.
async fn request_health() -> Response<Body> {
    app()
        .oneshot(
            Request::builder()
                .uri("/health")
                .body(Body::empty())
                .unwrap(),
        )
        .await
        .unwrap()
}

#[tokio::main]
async fn main() {
    println!("health status={}", request_health().await.status());
}

#[cfg(test)]
mod tests {
    use super::*;
    use axum::http::StatusCode;
    // Test bất đồng bộ vẫn chạy trên Tokio runtime riêng.
    #[tokio::test]
    async fn health_is_ok() {
        assert_eq!(request_health().await.status(), StatusCode::OK);
    }
}
