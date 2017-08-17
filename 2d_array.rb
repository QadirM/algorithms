# Enter your code here. Read input from STDIN. Print output to STDOUT
arr = []
6.times{|i| arr[i] = gets.split(' ').map(&:to_i)}
sum = -64
4.times do |index|
    4.times do |i|
        temp = arr[index][i] + arr[index][i+1] + arr[index][i+2] + arr[index+1][i+1] + arr[index+2][i] + arr[index+2][i+1] + arr[index+2][i+2]
        sum = temp if temp > sum
    end
end
print sum
