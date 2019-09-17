class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    hash_secret = 666.hash
    each { |ele| hash_secret ^= ele }
    hash_secret

    #secret_word = inject("") { |acc, el| acc += el.to_s }
    
  end
end

class String
  def hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
