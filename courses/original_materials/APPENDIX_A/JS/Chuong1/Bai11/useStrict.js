// 1. Kiểm tra biến chưa được khai báo:
function useStrict() {
  "use strict";

  x = 10; // Gây ra lỗi - x chưa được khai báo
  console.log(x);
  
}


// // 2. Gán giá trị cho thuộc tính chỉ đọc:
// "use strict";

// const obj = {};
// Object.defineProperty(obj, "x", { value: 10, writable: false });

// obj.x = 20; // Gây ra lỗi - Gán giá trị cho thuộc tính chỉ đọc
// console.log(obj.x);

// // 2. Xóa biến:
// "use strict";

// const x = 10;
// delete x; // Gây ra lỗi - Xóa biến không được phép
// console.log(x);

// // 3. Tham số trùng lặp trong khai báo hàm:
// "use strict";

// function sum(a, a, c) { // Gây ra lỗi - Tham số trùng lặp
//   return a + a + c;
// }

// console.log(sum(1, 2, 3));


