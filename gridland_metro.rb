# Enter your code here. Read input from STDIN. Print output to STDOUT
RowRange = Struct.new(:a, :b)

n, m, k = gets.strip.split.map(&:to_i)

h = Hash.new { |h, k| h[k] = Array.new }

k.times do
    r, c1, c2 = gets.strip.split.map(&:to_i)

    rowHash = h[r]
    if rowHash.empty?
        rowHash << RowRange.new(c1, c2)
    else
        (0..rowHash.length-1).each do |i|
            x = rowHash[i]

            if c1 > x.b
                if i < rowHash.length - 1
                    next
                else
                    rowHash << RowRange.new(c1, c2)
                    break
                end
            else
                x.a = [x.a, c1].min
                x.b = [x.b, c2].max
                break
            end
        end
    end
end

lamps = n * m
h.each do |k, v|
    v.each do |range|
        r = range.b - range.a + 1
        lamps -= r
    end
end

puts lamps
