// Tuần 8: Dependency injection
IClock clock=new SystemClock(); Console.WriteLine(clock.Now.Year);
public interface IClock{DateTime Now{get;}}
public sealed class SystemClock:IClock{public DateTime Now=>DateTime.UtcNow;}
