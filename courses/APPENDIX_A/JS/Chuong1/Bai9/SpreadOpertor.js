//Sao cheo mang

// function threeDot(){
//     const numbers =[1, 2, 3, 4, 5];
//     const copiedNubers = [...numbers];
//     console.log(copiedNubers);
//     document.getElementById("show").innerHTML = copiedNubers;
// }

// Ket hop mang

// function threeDot(){
//     const arr1 = [1, 2, 3];
//     const arr2 = [4, 5, 6];
//     const combinedArray = [...arr2,...arr1];
//     console.log(combinedArray);
//     document.getElementById("show").innerHTML = combinedArray;
// }

// Truyen tham so vao ham
// function sumNumbers(a, b, c){
//         return a + b + c;
// }
// const numbers = [1, 2, 3];
// const sum = sumNumbers(...numbers);
// console.log(sum);
// document.getElementById("show").innerHTML = sum;
    
// Sao chep mot doi tuong
// function copiedObject(){
//     const person = {
//         name: "Viet Chung",
//         age: 54
//     };
//     const copPerson = {...person};
    
//    console.log(copPerson);
//    document.getElementById("show").innerHTML = JSON.stringify(copPerson);

// }

// Ket hop thuoc tinh cua nhieu doi tuong
// function mergedObject(){
//     const obj1 = { name: "Viet Chung"};
//     const obj2 = { age: 54};
//     const mergeObject = {...obj1,...obj2};
    
//    console.log(mergeObject);
//    document.getElementById("show").innerHTML = JSON.stringify(mergeObject);

// }

// Sao chep mot phan cua mang goc
// function sliceObject(){
//     const number = [1, 2, 3, 4, 5, 6, 7];
//     const sliceNumbers = [...number.slice(0, 4)];
    
//    console.log(sliceNumbers);
//    document.getElementById("show").innerHTML = JSON.stringify(sliceNumbers);

// }

// Ket hop cac doi tuong va ghi de cac thuoc tinh cu
function combinedObject(){
    const defaultConfig = { theme: 'dark', fontSize: 16 };
    const userCofig = { fontSize: 20 };
    const combineObject = { ...defaultConfig, ...userCofig };  
   console.log(combineObject);
   document.getElementById("show").innerHTML = JSON.stringify(combineObject);

}


