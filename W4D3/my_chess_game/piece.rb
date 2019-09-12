require_relative "modules"

class Piece
  include Slideable
  def initialize(position, color)
    @pos = position
    @color = color
  end

  def inspect
    :===
  end

  def possible_moves
    horizontal_moves
  end


  private
  attr_reader :color, :pos
end