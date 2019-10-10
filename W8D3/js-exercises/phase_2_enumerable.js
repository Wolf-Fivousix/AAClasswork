function callback(ele) {
  console.log(ele);
};

Array.prototype.myEach = function (callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};

console.log([1,2,3].myEach(callback));

function callback2(ele)
{
  return ele * 2;
}

Array.prototype.myMap = function (callback) {
  let new_array = [];
  const func = function(el) { new_array.push(callback(el)) };
  this.myEach(func);
  return new_array;
};

console.log([1,2,3].myMap(callback2));














Array.prototype.myReduce = function (callback, initialValue = 0) {
  let acc = initialValue;
  const func = function(el) { acc = callback(acc, el) };
  this.myEach(func);
  return acc;
};


let xxxx = [1,2,3].myReduce(function(acc, el) {
  return acc + el;
});

console.log(xxxx)