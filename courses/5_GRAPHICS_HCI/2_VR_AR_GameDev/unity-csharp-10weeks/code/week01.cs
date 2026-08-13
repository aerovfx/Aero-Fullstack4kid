// Tuần 1: Game loop. Logic thuần C# để test trước khi gắn MonoBehaviour.
var state = new GameState(100, 50);
state.Apply(10);
if (state.Health != 90) throw new Exception("Invariant thất bại");
Console.WriteLine($"{state.Health}:{state.Energy}");
public sealed class GameState(int health, int energy)
{
    public int Health { get; private set; } = Math.Clamp(health, 0, 100);
    public int Energy { get; private set; } = Math.Clamp(energy, 0, 100);
    public void Apply(int cost)
    {
        if (cost < 0) throw new ArgumentOutOfRangeException(nameof(cost));
        Health = Math.Max(0, Health - cost);
    }
}
