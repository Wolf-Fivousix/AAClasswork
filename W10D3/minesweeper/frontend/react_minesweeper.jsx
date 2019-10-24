import React from 'react';
import ReactDOM from 'react-dom';
import Game from "../components/game";

document.addEventListener("DOMContentLoaded", () => {
  const boomboom = document.getElementById("boomboom");
  ReactDOM.render(<Game />, boomboom); 
});