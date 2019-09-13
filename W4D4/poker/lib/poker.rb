class Card
end

class Deck
  attr_reader :deck

  def initialize
    @deck = Array.new(52) { Card.new }
  end
end

class Hand
end

class Player
end

class Game
end