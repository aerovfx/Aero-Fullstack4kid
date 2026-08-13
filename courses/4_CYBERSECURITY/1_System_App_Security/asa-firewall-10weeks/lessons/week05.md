# Tuần 5: Lưu cấu hình, reload và change management

## Mục tiêu

- Phân biệt running-config và startup-config.
- Lưu/reload có kiểm soát và khôi phục cấu hình mặc định trong lab.
- Viết kế hoạch change có tiêu chí go/no-go và rollback.

## Video nguồn

Video 7–8 và 23–24: lưu, xóa cấu hình, reload và factory-default qua CLI/ASDM.

## Lệnh kiểm chứng

```text
show running-config
show startup-config
write memory
show version
```

`write erase`, `configure factory-default` và `reload` có thể làm mất cấu hình hoặc gián đoạn dịch vụ. Chỉ thực hiện trên lab hoặc maintenance window đã phê duyệt, sau khi xác minh đúng hostname/serial và có backup.

## Mẫu change record

- Mục tiêu và ticket:
- Thiết bị/serial:
- Snapshot trước change:
- Lệnh dự kiến:
- Kiểm thử kỹ thuật và nghiệp vụ:
- Ngưỡng rollback:
- Người phê duyệt và thời gian:

## Bài tập

Giáo viên đưa một change lỗi trong lab. Học viên phải phát hiện qua kiểm chứng, không lưu cấu hình lỗi và ghi rõ bước rollback.
## 20 code minh họa của tuần

- [Mở mục lục code tuần 05](../code/week05/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 05](../code/week05/README.md), học lần lượt từ `01_...` đến `20_...`.
