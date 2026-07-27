// Vận dụng Destructuring Assignment trong JavaScript:
// 1. Giản lược hoá cấu trúc Object:
function Destructuring(){
    const person = { name: 'VietChung', age: 30, country: 'Viet Nam' };

    // Trích xuất thuộc tính name và age từ object person
    const { name, age } = person;
    
    console.log(name); // Output: VietChung
    console.log(age); // Output: 30
}


// // 2. Giữ nguyên giá trị mặc định:
// const person = { name: 'VietChung', age: 30 };

// // Trích xuất thuộc tính name, age và country từ object person
// const { name, age, country = 'Unknown' } = person;

// console.log(name); // Output: VietChung
// console.log(age); // Output: 30
// console.log(country); // Output: Unknown


// // 3. Giản lược hoá cấu trúc Array:
// const numbers = [1, 2, 3, 4, 5];

// // Trích xuất các phần tử từ mảng numbers
// const [first, second, ...rest] = numbers;

// console.log(first); // Output: 1
// console.log(second); // Output: 2
// console.log(rest); // Output: [3, 4, 5]

// // 4 . Giản lược hoá cấu trúc Object trong hàm:
// function displayPersonInfo({ name, age }) {
//     console.log(`Name: ${name}`);
//     console.log(`Age: ${age}`);
//   }
  
//   const person = { name: 'VietChung', age: 30 };
  
//   displayPersonInfo(person);
//   // Output:
//   // Name: VietChung
//   // Age: 30
  
// // 5. Trích xuất giá trị từ mảng lồng nhau:
// const person = { name: 'VietChung', age: 30, address: { city: 'Quang Tri', country: 'Viet Nam' } };

// // Trích xuất thuộc tính city từ object person.address
// const { address: { city } } = person;

// console.log(city); // Output: Quang Tri

// // 6. Giản lược hoá cấu trúc Array trong hàm:
// function displayFirstAndLast([first, ...rest]) {
//     console.log(`First element: ${first}`);
//     console.log(`Last element: ${rest.pop()}`);
//   }
  
//   const numbers = [1, 2, 3, 4, 5];
  
//   displayFirstAndLast(numbers);
//   // Output:
//   // First element: 1
//   // Last element: 5
  
// // 7. Giản lược hoá cấu trúc Object và sử dụng alias:
// const person = { name: 'VietChung', age: 30 };

// // Trích xuất thuộc tính name và gán vào biến username
// const { name: username, age } = person;

// console.log(username); // Output: VietChung
// console.log(age); // Output: 30

// // 8. Trích xuất giá trị từ mảng lồng nhau và sử dụng giá trị mặc định:
// const users = [
//     { name: 'VietChung', age: 30 },
//     { name: 'Siri', age: 25 },
//   ];
  
//   // 9. Trích xuất thuộc tính name và country từ object users[0]
//   // Nếu thuộc tính country không tồn tại, sử dụng giá trị mặc định là 'Unknown'
//   const [{ name, country = 'Unknown' }] = users;
  
//   console.log(name); // Output: VietChung
//   console.log(country); // Output: Unknown

// //   10. Trích xuất giá trị từ mảng kết hợp với Rest Parameter:
// const numbers = [1, 2, 3, 4, 5];

// // Trích xuất phần tử đầu tiên và cuối cùng từ mảng numbers
// // Các phần tử còn lại được gom vào một mảng mới
// const [first, ...rest] = numbers;

// console.log(first); // Output: 1
// console.log(rest); // Output: [2, 3, 4, 5]

// // 11. Giản lược hoá cấu trúc Object và sử dụng giá trị mặc định cho các thuộc tính con:
// const person = { name: 'VietChung', age: 30, address: { city: 'Quang Tri' } };

// // Trích xuất thuộc tính name, age và city từ object person
// // Nếu thuộc tính address không tồn tại, sử dụng giá trị mặc định là 'Unknown'
// const { name, age, address: { city = 'Unknown' } } = person;

// console.log(name); // Output: VietChung
// console.log(age); // Output: 30
// console.log(city); // Output: Quang Tri

// // 12. Trích xuất giá trị từ mảng kết hợp với giá trị mặc định:
// const numbers = [1, 2, 3];

// // Trích xuất các phần tử thứ 1, 2 và 3 từ mảng numbers
// // Nếu các phần tử không tồn tại, sử dụng giá trị mặc định là 0
// const [first = 0, second = 0, third = 0] = numbers;

// console.log(first); // Output: 1
// console.log(second); // Output: 2
// console.log(third); // Output: 3








