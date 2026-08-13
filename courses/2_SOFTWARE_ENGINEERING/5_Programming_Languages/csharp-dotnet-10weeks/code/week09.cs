// Tuần 9: Kiểm thử
static int AddStock(int current,int amount)=>amount>0?current+amount:current;
if(AddStock(3,2)!=5||AddStock(3,-1)!=3) throw new Exception("test thất bại"); Console.WriteLine("2 test đạt");
