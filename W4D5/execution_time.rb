require 'byebug'

def my_min_slow(list)
  list.each do |element|
    return element if list.all? { |num| element <= num }
  end
end

def my_min_quicker(list)
  min = list.first
  list.each do |num|
    min = num if num < min
  end
  min
end

# p my_min_slow([ 0, 3, 5, 4, -5, 10, 1, 90 ])
# p my_min_quicker([ 0, 3, 5, 4, -5, 10, 1, 90 ])


def largest_contiguous_subsum(list)
  sub_sums = []
  (0...list.length).each do |i|
    (i...list.length).each do |j|
      sub_sum = list[i..j]
      sub_sums << sub_sum
    end
  end
  p sub_sums.length
  max_val = sub_sums.first.sum
  sub_sums.each do |new_sum|
    current_sum = new_sum.sum
    max_val = current_sum if max_val < current_sum
  end
  max_val
end


def largest_contiguous_subsum_linear(list)
  max_val = list.sum
  current_val = 0

  list.each do |ele|
    current_val += ele
    if current_val > max_val
      max_val = current_val
    end
    current_val = 0 if current_val < 0
  end
  max_val
end

# p largest_contiguous_subsum([5, 3, -7])                #8
# p largest_contiguous_subsum([2, 3, -6, 7, -6, 7])      #8
# p largest_contiguous_subsum([-5, -1, -3])             #-1


# p largest_contiguous_subsum_linear([5, 3, -7])
# p largest_contiguous_subsum_linear([2, 3, -6, 7, -6, 7])
# p largest_contiguous_subsum_linear([-5, -1, -3])


def first_anagram?(str_1, str_2)    # n!
  anagramer(str_1).include?(str_2)
end

def anagramer(str)
  return [str] if str.length == 1
  first = str[0]
  
  perms = anagramer(str[1..-1])
  anagrams = []
  # p perms
  perms.each do |ana|
    # debugger
    anagrams << first + ana
    # anagrams << ana + first
    (1...ana.length).each do |i|
      anagrams << ana[0...i] + first + ana[i..-1]
    end
    anagrams << ana + first
  end
  anagrams
end

def second_anagram?(str_1, str_2)      # n^2
  str_2_chars = str_2.chars
  str_1.each_char do |char|
    i = str_2_chars.find_index(char)
    str_2_chars.delete_at(i) unless i.nil?
  end
  str_2_chars.empty?
end

def third_anagram?(str_1, str_2)  #  nlogn
  str_1.chars.sort == str_2.chars.sort
end

def fourth_anagram?(str_1, str_2)   # n + m
  hash_1 = Hash.new(0)
  hash_2 = Hash.new(0)

  str_1.each_char { |char| hash_1[char] += 1 }
  str_2.each_char { |char| hash_2[char] += 1 }

  hash_1 == hash_2
end

def anagram_one_hash(str_1, str_2)
  hash = Hash.new(0)

  str_1.each_char { |char| hash[char] += 1 }
  str_2.each_char { |char| hash[char] -= 1 }

  # hash.values.all?(0) # same as bellow.
  hash.values.all? { |val| val == 0 }
end

# p first_anagram?("elvis", "lives")
# p first_anagram?("gizmo", "sally")
# p second_anagram?("elvis", "lives")
# p second_anagram?("gizmo", "sally")
# p third_anagram?("elvis", "lives")
# p third_anagram?("gizmo", "sally")
# p fourth_anagram?("elvis", "lives")
# p fourth_anagram?("gizmo", "sally")
p anagram_one_hash("elvis", "lives")
p anagram_one_hash("gizmo", "sally")