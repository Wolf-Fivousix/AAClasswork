// function sum()
// {
//   let num = 0;
//   let args = Array.from(arguments);
//   for (let i = 0; i < args.length; ++i)
//   {
//     num += args[i];
//   }
//   return num;
// }

function sum(...args) {
  let num = 0;
  for (let i = 0; i < args.length; ++i) {
    num += args[i];
  }
  return num;
}

// console.log(sum(1, 2, 3, 4) === 10);
// console.log(sum(1, 2, 3, 4, 5) === 15);

// Function.prototype.myBind = function(context) {
//   let that = this;
//   let extras = Array.from(arguments).slice(1);
//   return function () {
//     let args = Array.from(arguments);
//     return that.apply(context, extras.concat(args));
//   };
// };

Function.prototype.myBind = function(context, ...rest) {
  let that = this;
  return function (...rest2) {
    return that.apply(context, rest.concat(rest2));
  };
};

// ////////

class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

class Dog {
  constructor(name) {
    this.name = name;
  }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

// markov.says.myBind(pavlov)("meow", "Maureen");

// markov.says.myBind(pavlov, "meow")("Markov");

// markov.says.myBind(pavlov, "meow", "Kush")();

let curry = function(numArgs) {
  let numbers = [];
  return _curriedSum = function(number) {
    numbers = numbers.concat(number);
    // console.log("numargs: " + numArgs);
    // console.log("numbers: " + numbers);
    if (numbers.length === numArgs) {
      return sumArray(numbers);
    } else {
      return _curriedSum;
    }
  };
};

function sumArray(numbers) {
  let sum = 0;
  for (let i = 0; i < numbers.length; i++) {
        sum += numbers[i];
  }
  return sum;
}

// let a = curry(3);

// a = a(5);
// let b = a(6);
// let c = b(7);
// console.log("c: " + c);
// b = b(10)
// console.log("b: " + b);


// let z = curry(2);
// z = z(1);
// z = z(2);
// console.log("z " + z);


Function.prototype.curry = function(numArgs) {
  let numbers = [];
  let that = this;
    // sumThree function right here. (this)


  return function _curry(number) {   // Might be wrong?
    // numbers = numbers.concat(number);
    numbers.push(number);
    console.log(numbers);
    if (numbers.length === numArgs) {
      return that.call("Wolf", ...numbers);
    }
    else {
      return _curry;
    }
  };
};

function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
};