module Test
  def new_thingy(number)
    number.times { |n| p n }
  end

  def do_array
    each { |element| p element }
  end
end

class Minha_Classe
  def initialize
    @var = 25
    @prot = 100
  end

  def get_vars
    p var
    p self.prot
  end
  protected
  attr_reader :prot

  private
  attr_reader :var
end

class Minha_Classe2 < Minha_Classe
  def initialize
    super
  end
end

# test = Minha_Classe.new
# # test.new_thingy(5)
# test.array([1,2,3,4,5])

test = Minha_Classe.new
test.get_vars
# test2 = Minha_Classe2.new
# test2.get_vars