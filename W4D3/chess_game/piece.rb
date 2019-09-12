class Piece
    # (1) track its position and
    # (2) hold a reference to the Board. 
  def initialize(color, board, position)
    @color = color
    @board = board
    @pos = position
  end

  def inspect
    :===
  end

  def to_s
    # ???????
  end

  def empty?(position)
    board[position].nil?
  end

  def valid_moves
    # ???????
  end

  def pos=(value)
    board[pos] = value
  end

  def symbol
    color
  end

  private
  attr_reader :color, :board, :pos

  def move_into_check?(end_pos)
    # ???????
  end
end