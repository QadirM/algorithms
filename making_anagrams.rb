#!/bin/ruby

a = gets.strip
b = gets.strip
a = a.chars.sort.join
b = b.chars.sort.join
idx1, idx2 = 0, 0
deletions = 0
while (idx1 < a.length && idx2 < b.length)
    if a[idx1] == b[idx2]
        idx1 += 1
        idx2 += 1
    elsif a[idx1] < b[idx2]
        deletions += 1
        idx1 += 1
    else
        deletions += 1
        idx2 += 1
    end
end
deletions += (a.length - idx1) + (b.length - idx2)
puts(deletions)
