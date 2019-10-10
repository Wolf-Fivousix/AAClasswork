function range (start, end) {
  if (start >= end) {
    return [start];
  }
  return [start].concat(range(start+1, end));
}

// console.log(range(5,0));

function sumRec(arr)
{
  console.log(arr);
  if (arr.length === 0)
  {
    return 0;
  }
  if (arr.length === 1)
  {
    return arr[0];
  }
  return arr[0] + sumRec(arr.slice(1, arr.length));
}

// console.log(sumRec([1, 2, 3, 6, 8]));
// x^4 -- 4 rec calls. x^4 = (x^2)^2
// x^5

function exponent1(base, exp)
{
  if (exp === 0)
  {
    return 1;
  }
  return base * exponent1(base, exp - 1);
}

console.log(exponent1(2,16));

function exponent2(base, exp)
{
  if (exp === 0)
  {
    return 1;
  }
  else if (exp === 1)
  {
    return base;
  }
  else if (exp % 2 === 0)
  {
    return exponent2(base, exp / 2) ** 2;
  }
  else
  {
    return base * (exponent2(base, (exp - 1) / 2) ** 2);
  }
}

console.log(exponent2(2, 16));