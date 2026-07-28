# Tuần 2: Static triage PE

## Nguồn

Bài 2: x64dbg và Detect It Easy.

## Mục tiêu

- Nhận diện PE32/PE32+, architecture, section, import và dấu hiệu packing.
- Tính hash trước khi mở file.
- Phân biệt triage tĩnh với kết luận hành vi.

## Quy trình

```powershell
Get-FileHash .\samples\toy.exe -Algorithm SHA256
```

Mở bản sao trong Detect It Easy, ghi compiler/packer detection, entry point, entropy và overlay. Không upload file nội bộ lên dịch vụ công cộng.

Chạy script an toàn không thực thi binary:

```bash
python code/pe_triage.py samples/toy.exe
```

## Đọc kết quả đúng cách

Tên import như file/network API chỉ là chỉ báo capability, không chứng minh hành vi xấu. Packer detection cũng có false positive. Mọi nhận định phải gắn với evidence và mức confidence.

## Bài tập

So sánh bản Debug và Release của cùng source: hash, size, section, imports và strings. Giải thích khác biệt do compiler/build option.

