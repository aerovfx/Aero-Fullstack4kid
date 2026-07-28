# Tuần 3: Assembly và control flow nền tảng

## Nguồn

Bài 4: thao tác cơ bản trong x64dbg.

## Mục tiêu

- Đọc register, flag, stack và calling convention x64 cơ bản.
- Nhận diện function prologue/epilogue, call, return và conditional branch.
- Ánh xạ pseudocode tự viết sang assembly compiler tạo ra.

```c
int classify_score(int score) {
    if (score < 0) return -1;
    if (score >= 80) return 2;
    return 1;
}
```

Biên dịch source lab ở Debug và Release, sau đó tìm function bằng symbol. Theo dõi input `-1`, `50`, `80`; ghi register/flag ngay trước mỗi branch.

## Artifact

Tạo function map gồm address tương đối/module offset, purpose, input/output, caller/callee và confidence. Không coi tên do tool tự đoán là sự thật nếu chưa kiểm chứng.

## Bài tập

Giải thích tại sao compiler có thể dùng `cmov`, inline hoặc loại bỏ branch trong Release và vì sao offset tuyệt đối không ổn định giữa build.

