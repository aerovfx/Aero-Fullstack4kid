// Tuần 10: ASP.NET Core và API
var tasks=new List<TaskItem>(); tasks.Add(new(1,"Học Minimal API",false)); Console.WriteLine(System.Text.Json.JsonSerializer.Serialize(tasks));
public sealed record TaskItem(int Id,string Title,bool Done);
