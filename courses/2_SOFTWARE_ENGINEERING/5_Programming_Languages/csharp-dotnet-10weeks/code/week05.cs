// Tuần 5: LINQ
var values=new[]{1,2,3,4}; var even=values.Where(x=>x%2==0).Select(x=>x*x); Console.WriteLine(string.Join(",",even));
