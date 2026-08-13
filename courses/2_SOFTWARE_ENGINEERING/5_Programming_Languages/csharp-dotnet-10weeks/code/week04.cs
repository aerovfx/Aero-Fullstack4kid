// Tuần 4: Exception và resource
var path=Path.Combine(Path.GetTempPath(),"cs-week04.txt"); await File.WriteAllTextAsync(path,"using quản lý resource"); Console.WriteLine(path);
