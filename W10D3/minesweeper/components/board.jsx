import React from 'react';
import Tile from "./tile";

export default class Board extends React.Component {
  render() {
    const board = this.props.board;

    return (
      board.grid.map((row, i) =>
        <div key={i} id={`row`}>
          {row.map((col, j) =>  
              <Tile key={[i,j]} tile={board.grid[i][j]} update={this.props.update} />
          )}
        </div>
      )
    );
  }
}