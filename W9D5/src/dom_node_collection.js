class DOMNodeCollection {
  constructor(arr) {
    this.arr = arr;
  }

  // We are very confused by this instructions.
  // Are we supposed to rewrite the original array, or return something new?

  html(string){
    if(string) {
      this.arr = string;
    }
  return this.arr[0];
  }

}

module.exports = DOMNodeCollection;