# Enter your code here. Read input from STDIN. Print output to STDOUT

array = []

n = gets.chomp.to_i
array = [''] * 100
half = n/2

half.times do
    index, _ = gets.strip.split(' ')
    array[index.to_i] += '- '
end

half.times do
    index, str = gets.strip.split(' ')
    array[index.to_i] += "#{str} "
end

puts array.join.strip
