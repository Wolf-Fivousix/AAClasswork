let Piece = require("./piece");
let board = new Board();

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  const grid = [];
  for (let i = 0; i < 8; ++i)
  {
    grid.push(new Array(8));
  }
  grid[3][4] = new Piece('black');
  grid[4][3] = new Piece('black');
  grid[3][3] = new Piece('white');
  grid[4][4] = new Piece('white');
  // grid[3][4] = "○";
  // grid[4][3] = "○";
  // grid[3][3] = "●";
  // grid[4][4] = "●";
  return grid;
}

// console.log(_makeGrid());

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  if (this.isValidPos(pos))
    {
    return this.grid[pos[0]][pos[1]];
    }
  throw 'Not valid position';
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  if (this.grid[pos[0]][pos[1]])
    {
      return this.grid[pos[0]][pos[1]].color === color;
    }
  return false;
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  return (typeof (this.grid[pos[0]][pos[1]]) !== "undefined");
};



/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
};

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  return (pos[0] < 8 && pos[0] > -1 && pos[1] < 8 && pos[1] > -1);
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns null if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns null if it hits an empty position.
 *
 * Returns null if no pieces of the opposite color are found.
 */
function _positionsToFlip (board, pos, color, dir, piecesToFlip) {

  // Check if the same color.
  // Check if is the first piece we look into.
  // start position of the move we are making.

  let new_pos = [];
  let row = pos[0] + dir[0];
  let col = pos[1] + dir[1];

  if (row < 0 || col < 0 || row > 7 || col > 7)
    {
      return null;
    }
  
  new_pos.push(row);
  new_pos.push(col);

  const current_piece = board.grid[pos[0]][pos[1]];
  const next_piece = board.grid[new_pos[0]][new_pos[1]];

  // checks if position is in board && is empty
  if (!board.isValidPos(new_pos) || !next_piece)
  { 
    return null;
  }

  // return result if next piece is player's color
  if (next_piece.color === color)
    {
      if (piecesToFlip.length === 0)
        {
          return null;
        }
      return piecesToFlip;
    }
  else // if it's not, we will push our next piece
    { 
      piecesToFlip.push(next_piece);
    }

  // should return array or null below
  return _positionsToFlip(board, new_pos, color, dir, piecesToFlip);
}

// board.grid[5][3] = new Piece('white');
// _positionsToFlip (board, [3,3], 'white', [1,0], []);


/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
};

/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  let possible_piece = this.grid[pos[0]][pos[1]];
  let possible_flips = 0;

  Board.DIRS.forEach( (dir) => { 
    if (_positionsToFlip(this, pos, color, dir, []) !== null)
    {
      possible_flips += 1;
    }
   });
  // for (let i = 0; i < Board.DIRS.length; ++i) {
  //   if (_positionsToFlip(this, pos, color, Board.DIRS[i], []) !== null) {
  //     possible_flips += 1;
  //   }
  // }
  return (!possible_piece && possible_flips > 0);
};

// console.log(board.validMove([0,0], 'white'));

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  let validPositions = [];
  for (let i = 0; i < this.grid.length; ++i)
    {
    for (let j = 0; j < this.grid.length; ++j)
      {
      if (this.validMove([i, j], color))
      {
        validPositions.push([i, j]);
      }
      }
    }
  return validPositions;
};

module.exports = Board;

console.log(board.validMoves('white'));


// GRAVEYARD
//
//
//
// let new_pos = [];
// new_pos.push(pos[0] + dir[0]);
// new_pos.push(pos[1] + dir[1]);

// const current_piece = board.grid[pos[0]][pos[1]];
// const new_piece = board.grid[new_pos[0]][new_pos[1]];

// if (!(board.isValidPos(new_pos) || new_piece)) {
//   if (current_piece && current_piece.color !== color) {
//     return [current_piece];
//   }
//   return null;
// }

// let all_pieces = [];
// piecesToFlip.push(current_piece);
// // all_pieces = [current_piece].concat(_positionsToFlip(board, new_pos, color, dir));
// all_pieces = _positionsToFlip(board, new_pos, color, dir, piecesToFlip);

// if (all_pieces) {
//   return all_pieces.slice(1, (all_pieces.length));
// }

// return null;