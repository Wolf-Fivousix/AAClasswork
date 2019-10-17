class View {
  constructor(game, $el) {
    this.POSITIONS = [
      [0, 0],
      [0, 1],
      [0, 2],
      [1, 0],
      [1, 1],
      [1, 2],
      [2, 0],
      [2, 1],
      [2, 2]
    ];
    this.setupBoard($el);
    this.bindEvents();
    this.game = game;
  };

  bindEvents() {}

  makeMove($square) {}

  setupBoard() {}
}

View.prototype.setupBoard = function(figure) {
  let $ul = $("<ul></ul>");
  for (let i = 0; i < 9; i++) {
    let $li = $("<li></li>");
    $li.attr('pos', this.POSITIONS[i]);
    // $li.attr('pos', i);
    $li.appendTo($ul);
  }
  figure.append($ul);
};

View.prototype.bindEvents = function(){
  let $ul = $("ul");
  let that = this;
  $ul.on("click", function(event){
    let pos = [];
    let $li = $(event.target);
    pos.push(parseInt($li.attr('pos')[0]));
    pos.push(parseInt($li.attr('pos')[2]));
    if (that.game.currentPlayer === 'x'){
      $li.toggleClass('x');
      $li.text('X');
    } else {
      $li.toggleClass('o');
      $li.text('O');
    }
    that.game.playMove(pos);
  });


  this.makeMove();
};

module.exports = View;
