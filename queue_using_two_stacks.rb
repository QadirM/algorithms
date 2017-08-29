# Enter your code here. Read input from STDIN. Print output to STDOUT
class MyQueue
	def initialize
    @stack_oldest_on_top = []
    @stack_newest_on_top = []
  end

  def empty?
    @stack_oldest_on_top.empty? && @stack_newest_on_top.empty?
  end

  def peek
    raise 'Queue is empty!' if empty?
    shift_queue
    @stack_oldest_on_top.last
  end

  def enqueue(x)
    @stack_newest_on_top.push(x)
  end

  def dequeue
    raise 'Queue is empty!' if empty?
    shift_queue
    @stack_oldest_on_top.pop
  end

  private

  def shift_queue
    if @stack_oldest_on_top.empty?
      while @stack_newest_on_top.any?
        @stack_oldest_on_top.push(@stack_newest_on_top.pop)
      end
    end
  end
end

q = gets.chomp.to_i
queue = MyQueue.new
q.times do
  type, x = gets.chomp.split.map(&:to_i)
  case type
    when 1
      queue.enqueue(x)
    when 2
      queue.dequeue
    when 3
      puts queue.peek
  end
end
