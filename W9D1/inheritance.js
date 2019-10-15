// Function.prototype.inherits = function(Parent) {
//   function Surrogate () {};
//   Surrogate.prototype = Parent.prototype;
//   this.prototype = new Surrogate();
//   this.prototype.constructor = this;
// };

Function.prototype.inherits = function(parent) {
  this.prototype = Object.create(parent.prototype);
  this.prototype.constructor = this;
};

function MovingObject() { }
MovingObject.prototype.move = function(number) {
  console.log("number: " + number);
};

function Ship() { }
Ship.inherits(MovingObject);

function Asteroid() { }
Asteroid.inherits(MovingObject);

Asteroid.prototype.explode = function() {
  console.log("KABOOM!");
};


let blackPearl = new Ship();
blackPearl.move(5);

let destroyer = new Asteroid();
destroyer.move(500);
destroyer.explode(); //This should work
// blackPearl.explode(); //This should not work

console.log(MovingObject.prototype === Asteroid.prototype); //This should be false

let merryGoRound = new MovingObject();
console.log((typeof merryGoRound) === (typeof destroyer)); //Diego thinks true. Maureen is uncertain... Diego wins.
console.log(destroyer instanceof MovingObject); //Expected: Wolf and Maureen both think true. But the homework wants false
console.log(merryGoRound instanceof Asteroid); //hopefully false
console.log(MovingObject instanceof Asteroid); //hopefully false
console.log(Ship.prototype); 
console.log(destroyer.__proto__ === MovingObject.prototype);//false 