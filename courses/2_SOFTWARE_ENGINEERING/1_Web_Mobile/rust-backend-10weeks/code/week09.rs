use chrono::{Duration, Utc};
use jsonwebtoken::{decode, encode, DecodingKey, EncodingKey, Header, Validation};
use serde::{Deserialize, Serialize};

// Demo dùng hằng số; production phải đọc secret đủ mạnh từ biến môi trường.
const SECRET: &[u8] = b"replace-with-a-secret-from-the-environment";

// Claims là dữ liệu nằm trong payload JWT; exp là thời điểm hết hạn Unix.
#[derive(Debug, Serialize, Deserialize)]
struct Claims {
    sub: String,
    role: String,
    exp: usize,
}

fn main() -> Result<(), jsonwebtoken::errors::Error> {
    // Token chỉ có hiệu lực một giờ kể từ lúc phát hành.
    let claims = Claims {
        sub: "user-42".into(),
        role: "admin".into(),
        exp: (Utc::now() + Duration::hours(1)).timestamp() as usize,
    };
    // encode ký token; người dùng không thể sửa payload mà chữ ký vẫn hợp lệ.
    let token = encode(
        &Header::default(),
        &claims,
        &EncodingKey::from_secret(SECRET),
    )?;
    // decode đồng thời xác minh chữ ký và các điều kiện trong Validation.
    let verified = decode::<Claims>(
        &token,
        &DecodingKey::from_secret(SECRET),
        &Validation::default(),
    )?;
    println!("token={token}\nverified={:?}", verified.claims);
    Ok(())
}
