Mô-đun Decimal?<br/>

Có lẽ bạn sẽ tự hỏi tại sao chúng ta cần một mô-đun để thực hiện phép toán số học cơ bản với các số thập phân khi chúng ta có thể làm như vậy bằng cách sử dụng float.<br/>

Trước khi tôi trả lời câu hỏi này, tôi muốn bạn đoán về giá trị đầu ra nếu bạn gõ 0.1 + 0.2 trong giao diện console của Python. Nếu bạn đoán rằng đầu ra là 0.3, thì bạn sẽ ngạc nhiên khi bạn kiểm tra kết quả thực tế, đó là 0.30000000000000004. Bạn có thể thử một số phép tính khác như 0.05 + 0.1 và bạn sẽ nhận được 0.15000000000000002.<br/>

Để hiểu điều gì đang xảy ra ở đây, hãy cố gắng biểu diễn 1/3 ở dạng thập phân, và bạn sẽ nhận thấy rằng số này thật sự không dừng lại ở cơ số 10. Tương tự như vậy, một số số như 0.1 hoặc 1/10 không dừng lại ở cơ số 2. Vì những con số này vẫn cần phải được biểu diễn bằng cách nào đó, một số xấp xỉ được tạo ra khi lưu trữ chúng, dẫn đến những sai số đó.<br/>

Số 0.30000000000000004 thực sự rất gần với 0,3, do đó, phần lớn chúng ta có thể bỏ đi phần xấp xỉ này. Thật không may, phần xấp xỉ này sẽ không thể loại bỏ khi bạn đang mô phỏng một vụ phóng vệ tinh hoặc xử lý tiền. Một vấn đề khác với những xấp xỉ này là các lỗi vẫn tiếp tục tồn tại.<br/>

Để có được những kết quả chính xác mà chúng ta thường xử lý với chúng khi thực hiện các phép tính bằng tay, chúng ta cần một cái gì đó hỗ trợ tính toán số thập phân dấu chấm động một cách nhanh chóng, chính xác và mô-đun decimal thực hiện chính xác điều đó.<br/>

-----------------------------------------

Mô-đun Fractions

Bạn có thể phải đối mặt với những tình huống nơi mà bạn cần phải thực hiện các phép toán khác nhau trên phân số hoặc kết quả cuối cùng cần phải là một phân số. Mô-đun fractions có thể rất hữu ích trong những trường hợp này. Nó cho phép bạn tạo ra một đối tượng Fraction từ các con số, số float, số thập phân, và thậm chí cả chuỗi. Cũng giống như mô-đun decimal, có một số vấn đề với mô-đun này cũng như khi nói đến việc tạo các phân số từ các số float. Dưới đây là vài ví dụ:

from fractions import Fraction
from decimal import Decimal
Fraction(11, 35)
# returns Fraction(11, 35) 
Fraction(10, 18)
# returns Fraction(5, 9) 
Fraction('8/25')
# returns Fraction(8, 25) 
Fraction(1.13)
# returns Fraction(1272266894732165, 1125899906842624) 
Fraction('1.13')
# returns Fraction(113, 100) 
Fraction(Decimal('1.13'))
# returns Fraction(113, 100)
Bạn cũng có thể thực hiện các phép toán toán học đơn giản như cộng và trừ trên các phân số giống như số bình thường.

from fractions import Fraction
Fraction(113, 100) + Fraction(25, 18)
# returns Fraction(2267, 900) 
Fraction(18, 5) / Fraction(18, 10)
# returns Fraction(2, 1) 
Fraction(18, 5) * Fraction(16, 19)
# returns Fraction(288, 95) 
Fraction(18, 5) * Fraction(15, 36)
# returns Fraction(3, 2) 
Fraction(12, 5) ** Fraction(12, 10)
# returns 2.8592589556010197
Mô-đun này cũng có một vài phương thức quan trọng như limit_denominator(max_denominator) sẽ tìm và trả về một phân số gần nhất với giá trị của một phân số nhất định có mẫu số lớn nhất là max_denominator. Bạn cũng có thể trả về tử số của một phân số nhất định trong giới hạn thấp nhất bằng cách sử dụng thuộc tính numerator và mẫu số bằng cách sử dụng thuộc tính denominator.

from fractions import Fraction
Fraction('3.14159265358979323846')
# returns Fraction(157079632679489661923, 50000000000000000000) 
Fraction('3.14159265358979323846').limit_denominator(10000)
# returns Fraction(355, 113) 
Fraction('3.14159265358979323846').limit_denominator(100)
# returns Fraction(311, 99) 
Fraction('3.14159265358979323846').limit_denominator(10)
# returns Fraction(22, 7) 
Fraction(125, 50).numerator
# returns 5 
Fraction(125, 50).denominator
# returns 2
Bạn cũng có thể sử dụng mô-đun này với các hàm khác nhau trong mô-đun math để thực hiện các phép tính dựa trên phân số.

import math
from fractions import Fraction
math.sqrt(Fraction(25, 4))
# returns 2.5 
math.sqrt(Fraction(28,3))
# returns 3.0550504633038935 
math.floor(Fraction(3558, 1213))
# returns 2 
Fraction(math.sin(math.pi/3))
# returns Fraction(3900231685776981, 4503599627370496) 
Fraction(math.sin(math.pi/3)).limit_denominator(10)
# returns Fraction(6, 7)
Tóm tắt

Hai mô-đun này chắc là đủ để giúp bạn thực hiện các phép toán thông thường trên cả số thập phân và phân số. Như trình bày trong phần cuối, bạn có thể sử dụng các mô-đun này cùng với mô-đun math để tính toán giá trị của tất cả các kiểu hàm toán học theo định dạng mà bạn mong muốn.

Trong hướng dẫn tiếp theo của loạt bài này, bạn sẽ được tìm hiểu về mô-đun random trong Python.
