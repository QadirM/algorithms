class BinaryMinHeap
  def initialize(&prc)
    @store = []
    @prc = prc
  end

  def count
    store.length
  end

  def extract
    store[-1], store[0] = store[0], store[-1]
    val = store.pop
    self.class.heapify_down(store, 0, count, &prc)
    val
  end

  def peek
    store.first
  end

  def push(val)
    store << val
    self.class.heapify_up(store, count - 1, count, &prc)
    val
  end

  protected
  attr_accessor :prc, :store

  public
  def self.child_indices(len, parent_index)
    [(2 * parent_index) + 1, (2 * parent_index) + 2].select { |idx| idx < len }
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new{ |el1, el2| el1 <=> el2 }

    while ( ((2 * parent_idx) + 1) < (len) )
      child_idx = self.child_indices(len, parent_idx).min { |i, j| prc.call(array[i], array[j]) }

      if prc.call(array[child_idx], array[parent_idx]) == -1
        array[child_idx], array[parent_idx] = array[parent_idx], array[child_idx]
      else
        break
      end

      parent_idx = child_idx
    end

    array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new{ |el1, el2| el1 <=> el2 }

    while child_idx > 0
      parent_idx = self.parent_index(child_idx)

      if prc.call(array[child_idx], array[parent_idx]) == -1
        array[child_idx], array[parent_idx] = array[parent_idx], array[child_idx]
      else
        break
      end

      child_idx = parent_idx
    end

    array
  end
end
