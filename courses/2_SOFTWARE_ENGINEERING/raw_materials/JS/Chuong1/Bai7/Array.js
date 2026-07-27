// // Array
// function show(){
//     const myArray = ["Python", "Javascript", "Java", "R", "C", "C#", "C++"];
// //    const newArrayLen = myArray.length;
//     myArray.push("Pascal");
//     document.getElementById("show").innerHTML = myArray;
    
// }

// function show(){
//     const myArray = ["Python", "Javascript", "Java", "R", "C", "C#", "C++"];
//     myArray.push("Pascal");
//     const newArrayLen = myArray.length;
    
//     //LOOP
//     let arrayValue = "<ul>";
//     for (let i = 0; i < newArrayLen; i++){
//         arrayValue += "<li>" + myArray[i] + "</li>";
//     }
//     arrayValue += "</ul>"


//     document.getElementById("show").innerHTML = arrayValue;
    
// }

// function show(){
//     const myArray = ["Python", "Javascript", "Java", "R", "C", "C#", "C++"];
//     myArray.push("Pascal");
//     // const newArrayLen = myArray.length;
    
//     //LOOP
//     let arrayValue = "<ul>";
//     myArray.forEach(myFunction);
//     arrayValue += "</ul>"
//     function myFunction(value) {
//         arrayValue += "<li>" + value + "</li>";
//     }


//     document.getElementById("show").innerHTML = arrayValue;
    
// }

// function show(){
//     const myArray = ["Python", "Javascript", "Java", "R", "C", "C#", "C++"];
//     myArray.push("Pascal");

//     const newArray = myArray.map((item) => `<li>${item}</li>`);





//     document.getElementById("show").innerHTML = newArray;
    
// }

function show(){
    const myArray = ["Python", "Javascript", "Java", "R", "C", "C#", "C++"];
    myArray.push("Pascal");
    const result = myArray.filter(checkList);

    function checkList(checkList){
        return checkList
        != "Python"
    }
    document.getElementById("show").innerHTML = result;
}