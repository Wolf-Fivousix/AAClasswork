import React from 'react';
import Board from "./board";
import * as Minesweeper from "../minesweeper";

export default class Game extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
        board: new Minesweeper.Board(5, 5)
    };

    this.updateGame = this.updateGame.bind(this);
  }

  updateGame(tile, flag) {
    if(flag) console.log('🏁');
    else console.log("💣💣💣💣💣💣💣💣💣");
  }

  render() {
    return (
      <div className="game">
        <Board board={this.state.board} update={this.updateGame}/>
      </div>
    )
  }
}