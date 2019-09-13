require "byebug"

class Array
  def my_uniq
    inject([]) { |new_array, element| new_array += (new_array.include?(element) ? [] : [element]) }
  end

  def two_sum
    sums = []
    length.times do |index_1|
      (index_1 + 1...length).each do |index_2|
        sums << [index_1, index_2] if self[index_1] + self[index_2] == 0
      end
    end
    sums
  end

  def my_transpose
    self.transpose
  end
end

def stock_picker(daily_prices)
  buy = 0
  sell = nil
  (1...daily_prices.length).each { |index| sell = index if daily_prices[index] > daily_prices[buy] }
  sell.nil? ? nil : [buy, sell]
end