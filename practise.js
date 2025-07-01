// 1. Add Two Numbers using Java script
let a = 5;
let b = 10;
let sum = a + b;
console.log("Sum:", sum);

// 2. Check if a Number is Even or Odd
let num = 7;

if (num % 2 === 0) {
  console.log(num, "is even");
} else {
  console.log(num, "is odd");
}

// 3.Print Numbers 1 to 5 Using a Loop
for (let i = 1; i <= 5; i++) {
  console.log(i);
}

// 4.Reverse a String
let str = "hello";
let reversed = str.split('').reverse().join('');
console.log(reversed);

// 5.Checking Even and Odd Numbers Using if Inside a for Loop
for (let i = 1; i <= 10; i++) {
  if (i % 2 === 0) {
    console.log(i + " is even");
  } else {
    console.log(i + " is odd");
  }
}

// 6.Prime Number
for (let num = 2; num <= 20; num++) {
  let isPrime = true;
  
  for (let i = 2; i < num; i++) {
    if (num % i === 0) {
      isPrime = false;
      break;
    }
  }

  if (isPrime) {
    console.log(num + " is prime");
  } else {
    console.log(num + " is not prime");
  }
}

// 7. Factorial-5! = 5 × 4 × 3 × 2 × 1 = 120
function factorial(n) {
  let result = 1;

  for (let i = 1; i <= n; i++) {
    result *= i;
  }

  return result;
}

let number = 5;
console.log("Factorial of " + number + " is: " + factorial(number));

// 8. Split the String
let sentence = "Hello My Name is Java Script";
let words = sentence.split(" ");
console.log(words);

// 9. 
let sentence1 = "apple,banana,cherry,grape";
let limitedSplit = sentence1.split(",", 2);
console.log(limitedSplit);

// 10. Split using Regular Expression

let sentence2 = "apple123banana456cherry789";
let splitWords = sentence2.split(/\d+/); // Split by one or more digits
console.log(splitWords);

// 11.Split Using an Empty String
let word = "hello";
let letters = word.split("");
console.log(letters);

// 12.
let sentence3 = "apple,banana|cherry grape";
let fruits = sentence3.split(/[,| ]/); // Split by comma, pipe, or space
console.log(fruits);

// 13.
fruits = ["apple", "banana", "cherry", "apple"];
console.log(fruits[0]); // "apple"
console.log(fruits.length); 

// push
let fruits1 = ["apple", "banana", "cherry"];
fruits1.push("orange");
console.log(fruits1);
let removed = fruits1.pop();
console.log(fruits1);
console.log(removed);

// shift
let fruits2 = ["apple", "banana", "cherry"];
let rem = fruits2.shift();
console.log(fruits2);
console.log(removed);

// unshift
let fruits3 = ["banana", "cherry"];
let newLength = fruits3.unshift("apple");
console.log(fruits3);
console.log(newLength); 

// splice
let fruits4 = ["apple", "banana", "cherry", "date"];
let remove = fruits4.splice(1, 2);
console.log(fruits4);
console.log(removed);

// for each
let fruits5 = ["apple", "banana", "cherry"];
fruits5.forEach(function(fruit) {
  console.log(fruit);
});

// map
let numbers = [1, 2, 3, 4];
let squares = numbers.map(function(number) {
  return number * number;
});
console.log(squares);

// filter
let nums = [1, 2, 3, 4, 5];
let evenNumbers = nums.filter(function(number) {
  return number % 2 === 0;
});
console.log(evenNumbers);

// objects
let person = {
  name: "John",
  age: 30,
  isEmployed: true
};
console.log(person.name);
console.log(person["age"]);

let map = new Map();
map.set('name', 'Alice');
map.set('age', 25);
map.set('job', 'Developer');

console.log(map.get('name'));
console.log(map.size);

// set
let uniqueNumbers = new Set([1, 2, 3, 4, 5, 1, 2]);

console.log(uniqueNumbers);
console.log(uniqueNumbers.size);
console.log(uniqueNumbers.has(3));
uniqueNumbers.add(6);
console.log(uniqueNumbers);
