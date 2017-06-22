require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @capacity = 8
    @store = StaticArray.new(@capacity)
    @length = 0
  end

  # O(1)
  def [](index)
    raise "index out of bounds" if check_index(index)
    @store[index]
  end

  # O(1)
  def []=(index, value)
    raise "index out of bounds" if check_index(index)
    @store[index] = value
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length == 0
    @length -= 1
    temp = @store[@length]
    @store[@length] = nil
    temp
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if @length == @capacity
    @store[@length] = val
    @length += 1
  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" if @length == 0
    first_el = @store[0]
    temp = @store
    (1...@length).each do |idx|
      @store[idx - 1] = temp[idx]
    end
    @store[@length - 1] = nil
    @length -= 1
    first_el
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    resize! if @length == @capacity
    temp = @store
    @store = StaticArray.new(@capacity)
    @store[0] = val

    1.upto(@length) do |idx|
      @store[idx] = temp[idx - 1]
      puts @store[idx]
    end

    @length += 1
    val
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    index >= @length || index < 0
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    @capacity *= 2
    temp = @store
    @store = StaticArray.new(@capacity)
    @length.times do |idx|
      @store[idx] = temp[idx]
    end
  end
end
