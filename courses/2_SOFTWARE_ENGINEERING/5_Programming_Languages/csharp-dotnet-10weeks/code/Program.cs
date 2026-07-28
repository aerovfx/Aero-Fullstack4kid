var builder = WebApplication.CreateBuilder(args);
builder.Services.AddSingleton<ITaskRepository, InMemoryTaskRepository>();

var app = builder.Build();

app.MapGet("/tasks", (ITaskRepository repository) => repository.GetAll());

app.MapPost("/tasks", (CreateTaskRequest request, ITaskRepository repository) =>
{
    if (string.IsNullOrWhiteSpace(request.Title))
        return Results.ValidationProblem(new Dictionary<string, string[]>
        {
            [nameof(request.Title)] = ["Title is required"]
        });

    var task = repository.Add(request.Title.Trim());
    return Results.Created($"/tasks/{task.Id}", task);
});

app.Run();

public sealed record CreateTaskRequest(string Title);
public sealed record TaskItem(int Id, string Title, bool Done);

public interface ITaskRepository
{
    IReadOnlyCollection<TaskItem> GetAll();
    TaskItem Add(string title);
}

public sealed class InMemoryTaskRepository : ITaskRepository
{
    private readonly List<TaskItem> _tasks = [];
    private int _nextId = 1;

    public IReadOnlyCollection<TaskItem> GetAll() => _tasks.AsReadOnly();

    public TaskItem Add(string title)
    {
        var task = new TaskItem(_nextId++, title, false);
        _tasks.Add(task);
        return task;
    }
}
