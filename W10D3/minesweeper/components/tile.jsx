import React from 'react';
import Board from "./board";

export default class Tile extends React.Component {
  constructor(props) {
    super(props);
    this.handleClick = this.handleClick.bind(this);
  }

  render() {
    return(
      <p onClick={ () => {
        this.handleClick();
      } }> {this.tileCondition()} </p>
    );
  }

  tileCondition() {
    if (this.props.tile.bombed) return "💣";
    if (this.props.tile.explored) {
      return (this.props.tile.adjacentBombCount());
    }
    if (this.props.tile.flagged) return "⚑";
    return "▢";
  }

  handleClick() {
    const flag = event.altKey;
    this.props.update(this.props.tile, flag);
    console.log("Click, click, click...");
  }
  

}

 