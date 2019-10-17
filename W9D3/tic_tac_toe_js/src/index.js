const View = require('./ttt-view.js');
const Game = require('../solution/game.js');
let game = new Game();
// window.game = Game;
// window.view = View;

$(()=> {
    let $ttt = $('.ttt')
    let view = new View(game,$ttt);
    
  });


