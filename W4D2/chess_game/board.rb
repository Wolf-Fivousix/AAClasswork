require_relative "piece"
require "byebug"
class ImpossibleMoveError < StandardError; end

class Board
  attr_reader :board
  def initialize
    @board = Array.new(8) { Array.new(8) { nil } }
    place_pieces
  end

  def place_pieces
    # Row count start from the top left corner of the board and goes down.
    # Column count start from left to right, as if you were White King God.
    board.length.times do |row|
      board.length.times do |column|
        board[row][column] = Piece.new if start_place_holder(row)
      end
    end
  end

  def start_place_holder(row)
    row >= 6 || row <= 1 ? true : false
  end

  def inspect
    board.length.times { |row| p board[row] }
  end

  def [](position)
    board[position.first][position.last]
  end

  def move_piece(start_pos, end_pos)
    p "Moving #{board[start_pos.first][start_pos.last]} from #{start_pos.first},#{start_pos.last}"
    p "To #{board[end_pos.first][end_pos.last]} at #{end_pos.first},#{end_pos.last}"

    raise ImpossibleMoveError if board[start_pos.first][start_pos.last].nil?
    raise ImpossibleMoveError unless board[end_pos.first][end_pos.last].nil?

    board[end_pos.first][end_pos.last] = board[start_pos.first][start_pos.last]
    board[start_pos.first][start_pos.last] = nil
    p "Moving Successful! =)"
  end
  private
  attr_writer :board
end

board = Board.new
p board
# board.move_piece([0,0],[4,4])
# board.move_piece([0,0],[4,4]) # => Throw Error if not commented out.