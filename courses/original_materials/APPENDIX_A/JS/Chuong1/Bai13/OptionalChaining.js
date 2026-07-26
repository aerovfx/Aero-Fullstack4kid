// // // Cú pháp sử dụng toán tử ?.:
// // function OptionalChaining() {
// //   object?.property
// //   object?.method()

  
// // }

// // 1. Truy cập thuộc tính của một đối tượng có thể không tồn tại:
// function OptionalChaining() {
//   const user = {
//     id: 1,
//     name: 'VietChung',
//     address: {
//       street: '123 ABC Street',
//       city: 'Exampleville',
//       country: 'Exampleland'
//     }
//   };

//   const country = user.address?.country; // 'Exampleland'
//   const zipCode = user.address?.zipCode; // undefined
  
//   // Hiển thị kết qủa ra console.log và html.
//   console.log(country,zipCode);

//   const data = {
//     country: country,
//     zipCode: zipCode
//   };

//   document.getElementById("show").innerHTML = JSON.stringify(data);
// }

// // 2. Gọi một phương thức của một đối tượng có thể không tồn tại:
// function OptionalChaining(){
//   const calculator = {
//     add: (a, b) => a + b,
//     subtract: (a, b) => a - b
//   };
  
//   const result1 = calculator.add?.(5, 3); // 8
//   const result2 = calculator.multiply?.(2, 4); // undefined

//   // Hiển thị kết qủa ra console.log và html.
//   console.log(result1,result2);

//   const data = {
//     result1: result1,
//     result2: result2
//   };

//   document.getElementById("show").innerHTML = JSON.stringify(data);
  
// }


// 3 Truy cập thuộc tính của một đối tượng mà đối tượng gốc có thể không tồn tại:
// function OptionalChaining(){
//   const response = apiResponse?.data?.results[0]?.name;
//   console.log(response);
//   //document.getElementById("show").innerHTML = JSON.stringify(response);


// }

// 4. Kiểm tra tính sẵn có của một phương thức trước khi gọi nó:

const OptionalChaining = () => {
  if (logger?.log) {
    logger.log('Message');
  }
  
  // console.log(response);
  // document.getElementById("show").innerHTML = JSON.stringify(response);
}

