class Clock {
  constructor() {
    // 1. Create a Date object.
    let date = new Date();
    // 2. Store the hours, minutes, and seconds.
    this.hours = date.getHours();
    this.minutes = date.getMinutes();
    this.seconds = date.getSeconds();
    
    // 3. Call printTime.
    this.printTime();
    // 4. Schedule the tick at 1 second intervals.
    let that = this;

    setInterval(this._tick.bind(this), 1000);
  }

  printTime() {
    let time = `${this.hours}:${this.minutes}:${this.seconds}`;
    // Format the time in HH:MM:SS
    // Use console.log to print it.
    console.log(time);
  }
}

Clock.prototype._tick = function () {
  // 1. Increment the time by one second.
  this.seconds++;
  if (this.seconds === 60) {
    this.seconds = 0;
    this.minutes += 1;
    if (this.minutes === 60) {
      this.minutes = 0;
      this.hours += 1;
      if (this.hours === 24) {
        this.hours = 0;
      }
    }
  }
  // 2. Call printTime.
   return this.printTime();
};

// const clock = new Clock();


// const readline = require("readline");

// const reader = readline.createInterface({
//   input: process.stdin,
//   output: process.stdout
// });

// reader.question('typed:', (input) => {
//   console.log(`you typed: ${input}`);
//   reader.close();
// });

// function addNumbers(sum, numsLeft, compleationCallback) {
//   if (numsLeft <= 0)
//   {
//     return compleationCallback(sum);
//   }

//   const readline = require("readline");

//   const reader = readline.createInterface({
//     input: process.stdin,
//     output: process.stdout
//   });

//   reader.question("Please input a number: ", (input) => {
//     sum += parseInt(input);
//     console.log(`Current Sum: ${sum}`);
//     numsLeft--;
//     reader.close();
//     return addNumbers(sum, numsLeft, compleationCallback);
//   });
// }

// addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));



const readline = require("readline");

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});




function absurdBubbleSort(array, sortCompletionCallback)
{
  let sorted = false;
  while (!sorted)
  {
    sorted = true;
    for (let i = 0; i < array.length - 1; ++i)
    {
      let element1 = array[i];
      let element2 = array[i+1];

      // reader.question(`Is ${element1} greater then ${element2}? `, function (input)  {
      //   if (input === '>') {
      //     console.log(input);
      //     [array[i + 1], array[i]] = [array[i], array[i + 1]];
      //     sorted = false;
      //   } 
      // });
      reader.question(`Is ${element1} greater then ${element2}? `, () => console.log("hi"));
      console.log(array);
    }
    console.log("while");
  }
  return array;
}

absurdBubbleSort([4,5,3,2,1,10]);