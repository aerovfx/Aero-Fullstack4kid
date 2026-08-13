FROM rust:1.85-slim AS builder
WORKDIR /app
COPY Cargo.toml Cargo.lock* ./
COPY code ./code
RUN cargo build --release --bin week06

FROM debian:bookworm-slim
COPY --from=builder /app/target/release/week06 /usr/local/bin/server
EXPOSE 3000
CMD ["server"]
