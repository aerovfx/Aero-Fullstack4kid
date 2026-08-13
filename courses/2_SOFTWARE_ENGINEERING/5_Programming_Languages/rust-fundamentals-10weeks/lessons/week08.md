# Tuần 8: Efficient Rust và benchmarking

## Nguồn

Chương 13, 18: coercion, Option iteration, giảm allocation, builder pattern, Criterion và performance lint.

## Mục tiêu

- Tối ưu dựa trên đo lường, không dựa trên trực giác.
- Giảm clone/allocation có bằng chứng mà không làm API khó dùng.
- Thiết kế builder bảo đảm object hợp lệ khi build.

```rust
#[derive(Debug)]
struct ServerConfig { host: String, port: u16 }

#[derive(Default)]
struct ServerConfigBuilder { host: Option<String>, port: Option<u16> }

impl ServerConfigBuilder {
    fn host(mut self, host: impl Into<String>) -> Self { self.host = Some(host.into()); self }
    fn port(mut self, port: u16) -> Self { self.port = Some(port); self }
    fn build(self) -> Result<ServerConfig, &'static str> {
        Ok(ServerConfig { host: self.host.ok_or("missing host")?, port: self.port.ok_or("missing port")? })
    }
}
```

## Lab

Benchmark hai phiên bản text processing bằng Criterion, warm-up đủ, đo nhiều sample và ghi median/variance. Chạy Clippy performance lints, nhưng chỉ nhận tối ưu nếu test vẫn đúng và benchmark cải thiện có ý nghĩa.
## 20 code minh họa của tuần

- [Mở mục lục code tuần 08](../code/week08/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 08](../code/week08/README.md), học lần lượt từ `01_...` đến `20_...`.
