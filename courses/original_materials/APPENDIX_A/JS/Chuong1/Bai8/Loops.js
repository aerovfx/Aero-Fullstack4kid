// // MAP
// function ListOfLanguage(){
//     const myArray = [
//         {id: 1, name: "Python"}, 
//         {id: 2, name: "Javascript"}, 
//         {id: 3, name: "Java"}, 
//         {id: 4, name: "R"}, 
//         {id: 5, name: "C"}, 
//         {id: 6, name: "C#"}, 
//         {id: 7, name: "C++"},
//         {id: 8, name: "PHP"},
//         {id: 9, name: "RUBY"},
//         {id: 10, name: "SWIFT"},
    
//     ];
//     const listItems = myArray.map(({name, id}) => 
//         `<li>${name}</li>`
//     ).join('');

//     document.getElementById("show").innerHTML = `<ul>${listItems}</ul>`;
    
// }
// // ListOfLanguage(); 

// FOR
// function ListOfLanguage(){
//     const myArray = [
//         {id: 1, name: "Python"}, 
//         {id: 2, name: "Javascript"}, 
//         {id: 3, name: "Java"}, 
//         {id: 4, name: "R"}, 
//         {id: 5, name: "C"}, 
//         {id: 6, name: "C#"}, 
//         {id: 7, name: "C++"},
//         {id: 8, name: "PHP"},
//         {id: 9, name: "RUBY"},
//         {id: 10, name: "SWIFT"},
    
//     ];
//     let listItems = '';
//     for (let i = 0; i < myArray.length; i++) {
//         const { name } = myArray[i];
//         listItems +=  `<li>${name}</li>`
//     } 
       
//     document.getElementById("show").innerHTML = `<ul>${listItems}</ul>`;
    
// }
// // ListOfLanguage(); 


// //FOREACH
// function ListOfLanguage(){
//     const myArray = [
//         {id: 1, name: "Python"}, 
//         {id: 2, name: "Javascript"}, 
//         {id: 3, name: "Java"}, 
//         {id: 4, name: "R"}, 
//         {id: 5, name: "C"}, 
//         {id: 6, name: "C#"}, 
//         {id: 7, name: "C++"},
//         {id: 8, name: "PHP"},
//         {id: 9, name: "RUBY"},
//         {id: 10, name: "SWIFT"},
    
//     ];
//     let listItems = '';
//     myArray.forEach( ({ name }) => {
//         listItems +=  `<li>${name}</li>`;
        
//     })

        
//     document.getElementById("show").innerHTML = `<ul>${listItems}</ul>`;
    
// }
// // ListOfLanguage(); 


//WHILE
function ListOfLanguage(){
    const myArray = [
        {id: 1, name: "Python"}, 
        {id: 2, name: "Javascript"}, 
        {id: 3, name: "Java"}, 
        {id: 4, name: "R"}, 
        {id: 5, name: "C"}, 
        {id: 6, name: "C#"}, 
        {id: 7, name: "C++"},
        {id: 8, name: "PHP"},
        {id: 9, name: "RUBY"},
        {id: 10, name: "SWIFT"},
    
    ];
    let listItems = '';
    let i = 0;
    while (i < myArray.length) {
        const { name } = myArray[i];
        listItems +=  `<li>${name}</li>`;
        i++;
    }
        
    document.getElementById("show").innerHTML = `<ul>${listItems}</ul>`;
    
}
// ListOfLanguage(); 