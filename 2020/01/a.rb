#!/usr/bin/env ruby
# frozen_string_literal: true

input = File.readlines("input", chomp: true).map(&:to_i)

def find_pair_equal_to(list_of_numbers, sum)
  list_of_numbers = list_of_numbers.dup
  while popped = list_of_numbers.pop
    found = list_of_numbers.find { |el| popped + el == sum }
    return [found, popped] if found
  end
end

def find_triplet_equal_to(list_of_numbers, sum)
  list_of_numbers = list_of_numbers.dup
  while popped = list_of_numbers.pop
    found = find_pair_equal_to(list_of_numbers, sum - popped)
    return found << popped if found
  end
end

pair = find_pair_equal_to(input, 2020)
p "pair: #{pair} => #{pair.reduce(:*)}"
triplet = find_triplet_equal_to(input, 2020)
p "triplet: #{triplet} => #{triplet.reduce(:*)}"
