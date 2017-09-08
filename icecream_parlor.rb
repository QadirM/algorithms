#!/bin/ruby

def search_from_array(array, value)
  array.index value
end

def return_flavors(array, m, n)
  n.times do |i|
    flavor2_index = search_from_array(array[(i + 1)..n], m - array[i])
    next if flavor2_index.nil?

    return "#{i + 1} #{flavor2_index + i + 2}"
  end
end

t = gets.strip.to_i
for a0 in (0..t-1)
  m = gets.strip.to_i
  n = gets.strip.to_i
  a = gets.strip.split(' ').map(&:to_i)
  puts return_flavors(a, m, n)
end
