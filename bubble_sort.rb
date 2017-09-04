#!/bin/ruby

n = gets.strip.to_i
a = gets.strip
a = a.split(' ').map(&:to_i)

swaps = 0
a.size.times do
  (0...a.size - 1).each do |i|
    if a[i] > a[i + 1]
      a[i], a[i + 1] = a[i + 1], a[i]
      swaps += 1
    end
  end
end

puts "Array is sorted in #{swaps} swaps."
puts "First Element: #{a.first}"
puts "Last Element: #{a.last}"
