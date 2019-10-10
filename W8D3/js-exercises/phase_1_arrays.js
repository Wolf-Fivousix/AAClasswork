Array.prototype.uniq = function () {
  let arr = [];
  for (let i = 0; i < this.length; i++) {
    let ele = this[i];
    if (arr.includes(ele)) {

    } else {
      arr.push(ele);
    }
  }
  return arr;
}
console.log(([1, 2, 2, 3, 3, 3].uniq()));

Array.prototype.twoSum = function () {
  let new_arr = [];
  for (let i = 0; i < this.length - 1; i++) {
    for (let j = i + 1; j < this.length; j++) {
      let first = this[i];
      let second = this[j];
      if (first + second === 0) {
        new_arr.push([i, j]);
      }
    }
  }
  return new_arr;
}

// [1,2,-1] => [[0, 2]], []
console.log([1,2,-1].twoSum());
console.log([0, 3, 1, 0, -3].twoSum());

Array.prototype.transpose = function () {
  let new_array = [];
  for(let i = 0; i < this.length; i++)
  {
    new_array[i] = new Array(this.length);
  }

  for(let i = 0; i < this.length; i++)
  {
    for(let j = 0; j < this.length; j++)
    {
      new_array[j][i] = this[i][j];
    }
  }
  return new_array;
}

let original = [
                  [1,2,3],
                  [4,5,6],
                  [7,8,9]
                ];
console.log(original.transpose());