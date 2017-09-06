#!/bin/ruby

class MergeSort
  attr_accessor :swaps

  def initialize
    self.swaps = 0
  end

  def sort(elements)
    return elements if elements.count <= 1

    middle = elements.length / 2
    left = elements[0, middle]
    right = elements[middle, elements.length]
    sorted_left = sort(left)
    sorted_right = sort(right)
    merge(sorted_left, sorted_right)
  end

  def merge(left, right)
    return left if right.empty?
    return right if left.empty?

    result = []
    while(left.count > 0 && right.count > 0)
      if left.first <= right.first
        result << left.shift
      else
        self.swaps += left.count
        result << right.shift
      end
    end

    while(left.count > 0)
      result << left.shift
    end

    while(right.count > 0)
      result << right.shift
    end

    result
  end
end


t = gets.strip.to_i
for a0 in (0..t-1)
  n = gets.strip.to_i
  arr = gets.strip
  arr = arr.split(' ').map(&:to_i)
  s = MergeSort.new
  s.sort arr
  puts s.swaps
end
