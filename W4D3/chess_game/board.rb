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
    p "Moving #{self[start_pos]} from #{start_pos.first},#{start_pos.last}"
    p "To #{self[end_pos]} at #{end_pos.first},#{end_pos.last}"

    raise ImpossibleMoveError if self[start_pos].nil?
    raise ImpossibleMoveError unless self[end_pos].nil?

    self[end_pos] = self[start_pos]
    self[start_pos] = nil
    p "Moving Successful! =)"
  end
  private
  attr_writer :board

  def []=(position, piece)
    board[position.first][position.last] = piece
  end
end

board = Board.new
p board
board.move_piece([0,0],[4,4])
# board.move_piece([0,0],[4,4]) # => Throw Error if not commented out.