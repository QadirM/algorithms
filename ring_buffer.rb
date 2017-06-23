require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @capacity = 8
    @store = StaticArray.new(@capacity)
    @length = 0
    @start_idx = 0
  end

  # O(1)
  def [](index)
    raise "index out of bounds" if check_index(index)
    actual_idx = (index + @start_idx) % @capacity
    @store[actual_idx]
  end

  # O(1)
  def []=(index, val)
    raise "index out of bounds" if check_index(index)
    actual_idx = (index + @start_idx) % @capacity
    @store[actual_idx] = val
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length == 0
    @length = @length - 1
    pos = (@start_idx + @length) % @capacity
    @store[pos]
  end

  # O(1) ammortized
  def push(val)
    resize! if @length == @capacity
    pos = (@start_idx + @length) % @capacity
    @store[pos] = val
    @length = @length + 1
    val
  end

  # O(1)
  def shift
    raise "index out of bounds" if @length == 0

    @start_idx = (@start_idx + 1) % @capacity
    @length = @length - 1
    @store[@start_idx - 1]
  end

  # O(1) ammortized
  def unshift(val)
    resize! if @length == @capacity
    @start_idx = (@start_idx - 1) % @capacity
    @store[@start_idx] = val
    @length = @length + 1
    val
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    index >= @length || index < -@length
  end

  def resize!
    temp = @store
    i = @start_idx
    j = 0
    @capacity *= 2
    @store = StaticArray.new(@capacity)

    while (j < @length)
      @store[j] = temp[i]
      i = (i + 1) % @length
      j+= 1
    end

    @start_idx = 0

  end
end
