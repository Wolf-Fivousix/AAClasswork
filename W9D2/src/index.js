console.log('webpacks working');
const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");
window.MovingObject = MovingObject;
window.Asteroid = Asteroid;



window.addEventListener('DOMContentLoaded', (event) => {
  const canvas = document.getElementById("game-canvas");
  const context = canvas.getContext("2d");
  context.fillStyle = "black";
  context.fillRect(0, 0, 500, 500);
  const mo = new MovingObject([150, 150], [100, 100], 50, "teal");
  mo.draw(context);
  console.log(mo.pos);
  console.log(mo.vel);
  mo.move();
  console.log(mo.pos);
  
  
  let myBigAster = new Asteroid([250, 265]);
  console.log(myBigAster);
  myBigAster.draw(context);
  // setInterval(el => myBigAster.vel )
  setInterval(el => myBigAster.move(), 250);
  setInterval(el => myBigAster.draw(context), 250);
});





console.log('Dragon');

