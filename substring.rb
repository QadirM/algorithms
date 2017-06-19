# string = "abfegac12a3d"
# [a,a,c,d]
# Time complexity: O(n^2)

def shortest_substring1(str, arr)

  hash = Hash.new{|h,k| h[k]= 0}

  arr.each do |el|
    hash[el] += 1
  end
  temp_hash = hash.dup

  str.each_char do |c|
    if temp_hash.keys.include?(c)
      temp_hash[c] -= 1
    end
  end

  if temp_hash.values.any?{|el| el > 0}
    return nil
  end

  ans = str

  str.chars.each_with_index do |x, idx_x|
    if hash.keys.include?(x)
      temp_hash = hash.dup
      curr_sub = ""
      y = idx_x

      while y < str.length
        if hash.keys.include?(str[y])
          temp_hash[str[y]] -= 1
        end
        curr_sub << str[y]
        if temp_hash.values.all?{|el| el <= 0}
          if curr_sub.length < ans.length
            ans = curr_sub
          end

          break
        end
        y += 1
      end

    end

  end

  ans
end
