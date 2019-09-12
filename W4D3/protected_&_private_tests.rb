class Animal
  attr_reader :name
  def initialize(name = "Some Friendly Random Animal")
    @name = name
  end

  def whisper
    p "Whisssssper"
  end

  def talk
    speak
  end

  def shout
    howl
  end
  protected
  def speak
    p "Hi, I'm #{self.name}"
  end

  private
  def howl
    p "AAAAaaauuuUUUUUuuuUUu"
  end
end

class Wolf < Animal

  def commune(other_wolf)
    puts "Black Wolf is calling Gray Wolf for a match! They will commune together through a Wolf Public Method."
    self.speak
    other_wolf.speak
    puts "---Both can call their Protected methods."
    puts
    
    howl
    # other_wolf.howl
    puts "---But ONLY #{self.name} can call it's own PRIVATE method. We can NOT access her companion's private method."
    puts "That's because to call other_wolf private method we need to type < other_wolf.howl >, but private methods may NOT be called with an explicit caller."
  end
end

puts "Animals can make this sounds..."
animal = Animal.new
animal.whisper
# animal.speak # Does not work. Throw NoMethodError, have to use Public interface.
# animal.howl # Does not work. Throw NoMethodError, have to use Public interface.
animal.talk
animal.shout

puts
puts "Wolves time. Wolf has access to ALL methods from Animal. Public, Protected and Private."
gray_wolf = Wolf.new("Gray Wolf")
gray_wolf.whisper
gray_wolf.talk
gray_wolf.shout

puts
p "Now is pack time!"
puts
black_wolf = Wolf.new("Black Wolf")
black_wolf.commune(gray_wolf)