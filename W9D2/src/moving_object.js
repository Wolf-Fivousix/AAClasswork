function MovingObject(pos, vel, radius, color) {
    this.pos = pos,
    this.vel = vel,
    this.radius = radius;
    this.color = color; 

}

MovingObject.prototype.draw = function (ctx) {
  ctx.beginPath();
  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);
  ctx.strokeStyle = this.color;
  ctx.fillStyle = this.color;
  ctx.fill();
  ctx.stroke();
};
MovingObject.prototype.move = function() {
  this.pos = [this.pos[0] + this.vel[0], this.pos[1] + this.vel[1]];
  console.log(this.pos)
  return this.pos;
};

module.exports = MovingObject; 

