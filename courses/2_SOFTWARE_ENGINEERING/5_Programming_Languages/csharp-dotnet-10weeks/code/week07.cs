// Tuần 7: Async/await
using var cts=new CancellationTokenSource(TimeSpan.FromSeconds(1)); await Task.Delay(10,cts.Token); Console.WriteLine("Hoàn tất async");
