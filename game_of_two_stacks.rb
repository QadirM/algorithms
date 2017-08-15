#!/bin/ruby


g = gets.strip.to_i
for a0 in (0..g-1)
  n,m,z = gets.strip.split(' ').map(&:to_i)
  a = gets.strip.split(' ').map(&:to_i)
  b = gets.strip.split(' ').map(&:to_i)
  count=0
  asum=[0]+a.map{|x|count+=x}
  #puts asum.join(" ")
  count=0
  bsum=[0]+b.map{|x|count+=x}
  #puts bsum.join(" ")
  ans=asum.map.with_index do |x,i|
    if x>z
      0
    elsif x==z
      i
    else
      r=z-x
      ((0...bsum.length).bsearch{|y|bsum[y]>r}||bsum.length)-1+i
    end
  end
  puts ans.max#join(" ")
    # your code goes here
end
