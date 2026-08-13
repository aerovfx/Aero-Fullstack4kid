# Modern C#/.NET — 10 tuần

Khóa học đi từ type system, OOP và LINQ đến async, dependency injection, testing và tư duy ASP.NET Core API.

## Cấu trúc

- [Lịch học](schedule.md)
- `lessons/week01.md` … `week10.md`: bài học.
- `code/week01.cs` … `week10.cs`: ví dụ chạy độc lập.
- `exercises/week01` … `week10`: starter cho học viên.
- [Dự án cuối khóa](projects/final_project.md)

## Chạy

```bash
dotnet run --project code/Examples.csproj -p:Week=week01
```

Bật nullable và warnings-as-errors; luồng async phải hỗ trợ hủy khi tác vụ có thể kéo dài.
