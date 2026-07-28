# Modern C#/.NET — 10 tuần

Khóa dùng C# hiện đại trên .NET, đi từ type system và OOP tới LINQ, async/await, dependency injection, kiểm thử và ASP.NET Core Minimal API.

## Chuẩn bị

```bash
dotnet --info
dotnet new console -n TaskApp
cd TaskApp
dotnet run
```

## Lộ trình

| Tuần | Chủ đề | Code trọng tâm | Sản phẩm |
|---|---|---|---|
| 1 | .NET CLI, type, nullable | top-level statement, `var`, `string?` | Máy tính chi tiêu |
| 2 | Điều khiển, method, collection | `List<T>`, `Dictionary<K,V>` | Grade book |
| 3 | OOP và record | class, interface, record | Domain model |
| 4 | Exception và resource | `try`, `using`, disposable | File importer |
| 5 | LINQ | `Where`, `Select`, `GroupBy` | Report engine |
| 6 | Generic, delegate, event | `Func`, `Action`, event | Notification service |
| 7 | Async/await | `Task`, cancellation token | HTTP client |
| 8 | Dependency injection | service lifetime, options | Service layer |
| 9 | Testing | xUnit, mock/fake, integration test | Test suite |
| 10 | ASP.NET Core | Minimal API, validation, OpenAPI | Task API |

## Ví dụ cốt lõi: record, LINQ và nullable

```csharp
public sealed record TaskItem(int Id, string Title, bool Done);

var tasks = new List<TaskItem>
{
    new(1, "Learn LINQ", false),
    new(2, "Write tests", true)
};

var openTitles = tasks
    .Where(task => !task.Done)
    .Select(task => task.Title)
    .ToList();

Console.WriteLine(string.Join(", ", openTitles));
```

LINQ tạo pipeline khai báo; `ToList()` mới thực thi và materialize kết quả. Không nên gọi `ToList()` sớm nếu còn nhiều bước lọc.

## Ví dụ async có hủy tác vụ

```csharp
static async Task<string> DownloadAsync(Uri uri, CancellationToken cancellationToken)
{
    using var client = new HttpClient();
    return await client.GetStringAsync(uri, cancellationToken);
}
```

Ứng dụng thực tế nên nhận `HttpClient` qua dependency injection để tái sử dụng connection, thay vì tạo client mới cho mỗi request.

## Đồ án cuối khóa

Xây Task Web API có CRUD, validation, lưu dữ liệu, logging và OpenAPI. Business logic nằm ngoài endpoint, được inject qua interface; có unit test và integration test cho các response 200, 400 và 404.

Code khởi đầu: [`code/Program.cs`](code/Program.cs).

Chạy project mẫu bằng `dotnet run --project code/TaskApi.csproj`, sau đó gọi `GET http://localhost:5000/tasks` hoặc địa chỉ được in trên terminal.

