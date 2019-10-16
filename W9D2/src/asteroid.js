const MovingObject = require("./moving_object.js");
const Util = require("./util.js");
// const util = new Util();

function Asteroid(pos) {
  console.log("Making an asteroid...");
  // super(pos, [20, 20], this.RADIUS, this.COLOR);
  // Super doen't work in here, since we are using ES4.
  MovingObject.apply(this, [pos, [5, 5], 16, "gray"]);
}

Util.inherits(Asteroid, MovingObject);



module.exports = Asteroid;