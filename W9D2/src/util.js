const Util = {
  inherits(childClass, parentClass) {
    function Surrogate () {}
    Surrogate.prototype = parentClass.prototype;
    childClass.prototype = new Surrogate();
    childClass.prototype.constructor = childClass;
  }  
};



module.exports = Util;






















// / Write a recursive function stringIncludeKey(string, key) that takes in
// a string to search and a key string. Return true if the string contains all
// of the characters in the key in the same order that they appear in the key.
//
// stringIncludeKey("cadbpc", "abc") => true
// stringIncludeKey("cba", "abc") => false