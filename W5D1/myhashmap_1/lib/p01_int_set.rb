require 'byebug'
class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = []
    max.times { @store << false }
  end

  def insert(num)
    raise 'Out of bounds' if num > store.length || num < 0
    store[num] = true
  end

  def remove(num)
    raise 'Out of bounds' if num > store.length || num < 0
    store[num] = false
  end

  def include?(num)
    store[num] == true
  end

  private
  attr_writer :store
  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    idx = num % num_buckets
    @store[idx].each.with_index do |n, i|
      @store[idx].delete_at(i) if n == num
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless include?(num)
      self[num] << num
      @count += 1
    end
    resize! if @count == num_buckets
  end

  def remove(num)
    if include?(num)
      self[num].each.with_index { |n, i| self[num].delete_at(i) if n == num }
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    # new_set = ResizingIntSet.new(num_buckets*2)
    # @store.flatten.each { |element| new_set.insert(element) }
    # self.store = new_set.store # This doen't work.

    new_store = Array.new(num_buckets * 2) { Array.new }
    @store.flatten.each do |n|
      i = n % (num_buckets * 2)
      new_store[i] << n
    end
    @store = new_store
  end
end
