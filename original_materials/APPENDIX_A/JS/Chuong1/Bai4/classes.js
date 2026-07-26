// class ClassName {
//     constructor() {...}
// }

// class Person {
//     constructor(name) {
//         this.name = name;
//     }
// }

class Car {
    constructor(name, year) {
        this.name = name;
        this.year = year;
    }
    age() {
        const date = new Date();
        return date.getFullYear() - this.year;
    }
}
    
const myCar = new Car("Ford Ranger", 2019);
document.write("My car is " + myCar.age() + " years old");
