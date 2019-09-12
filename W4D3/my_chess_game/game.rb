require_relative "board"

board = Board.new
p board

p "Choose your piece, God: "
input = gets.chomp.split(",").map(&:to_i)
p input
unless board[input].nil?
  possible_moves = board[input].possible_moves
  p board.validate_possible_moves(input, possible_moves)
end


# board.move_piece([0,0],[4,4])
# board.move_piece([0,0],[4,4]) # => Throw Error if not commented out.
p board