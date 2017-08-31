
def lena_sort(lenArrayPer,c,comparisons,arrayLess = [])

  pivot = lenArrayPer[0];
  arrayLess = Array.new

  (1..lenArrayPer.size-1).each do |i| #for (i = 1; i < nums.size; ++i) {
    # Comparison
    if (lenArrayPer[i] < pivot)
      arrayLess << lenArrayPer[i]
      comparisons += 1
    end
  end
  if comparisons < c
    lena_sort(lenArrayPer,c,comparisons,arrayLess)
  elsif comparisons > c
    return [-1]#"c too big"
  elsif comparisons == c
    return lenArrayPer
  end
end

q = gets.strip.to_i
for a0 in (0..q-1)
  len,c = gets.strip.split(' ')
  len = len.to_i
  c = c.to_i
  #####################
  lenArray = Array.new
  (1..len).each do |i|
    lenArray << i
  end
  lenArray = lenArray.reverse
  lenArrayPer = lenArray.permutation.to_a
#  print lenArrayPer[0]
  comparisons = 0
  puts "#{lena_sort(lenArrayPer[0],c,comparisons).join(" ")}\n"
#  (0..lenArrayPer.size-1).each do |i|
#    if c == lena_sort(lenArrayPer[i])
#      puts lena_sort(lenArrayPer[i])
#      break
#    end
#  end
end
