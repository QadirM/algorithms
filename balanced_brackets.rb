def check(stack, symbol)
  !stack.empty? && stack.last == symbol
end

def balanced?(input)
  stack = []
  input.each do |symbol|
    if stack.empty?
      stack.push(symbol)
    else
      case symbol
      when '}'
        stack.pop if check(stack, '{')
      when ')'
        stack.pop if check(stack, '(')
      when ']'
        stack.pop if check(stack, '[')
      else
        stack.push(symbol)
      end
    end
  end
  stack.empty?
end

n = gets.chomp!.to_i
n.times do
  input = gets.chomp.split('')
  puts balanced?(input) ? 'YES' : 'NO'
end
