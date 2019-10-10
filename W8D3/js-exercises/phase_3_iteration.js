Array.prototype.bubbleSort = function() 
{
  for (let i = 0; i < this.length - 1; i++)
  {
    for (let j = 1; j < this.length - i; j++)
    {
      if (this[j - 1] > this[j])
      {
        this[j - 1] ^= this[j];
        this[j] ^= this[j - 1];
        this[j - 1] ^= this[j];
      }
    }
  }
  
  return this;
};
let test = [4,3,5,2];
console.log(test.bubbleSort());

String.prototype.substrings = function () {
  let substrings = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = i + 1; j <= this.length; j++) {
      substrings.push(this.slice(i, j));
    }
  }
  return substrings;
}

console.log("wolf".substrings());