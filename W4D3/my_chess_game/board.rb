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
        board[row][column] = Piece.new([row, column], :white) if row <= 1
        board[row][column] = Piece.new([row, column], :black) if row >= 6
      end
    end
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

  def validate_possible_moves(original, moves)
    moves.select { |move| inside_board?(original, move) }

  end


  private
  attr_writer :board

  def []=(position, piece)
    board[position.first][position.last] = piece
  end

  def inside_board?(pos, delta)
    possible_position = [pos.first + delta.first, pos.last + delta.last]
    return false if possible_position.first < 0 || possible_position.first > 7
    return false if possible_position.last < 0 || possible_position.last > 7
    true
  end
end