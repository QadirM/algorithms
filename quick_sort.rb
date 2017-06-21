class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).
  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
  end
  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return array if length <= 1

    part = partition(array, start, length, &prc)
    array[start], array[part] = array[part], array[start]
    sort2!(array, start, part - start, &prc)
    sort2!(array, part + 1, length - part - 1, &prc)
  end
  def self.partition(array, start, length, &prc)
    prc ||= Proc.new{|x, y| x <=> y}

    # pivot = start + rand(length)
    # array[start], array[pivot] = array[pivot], array[start]

    pivot = array[start]
    partition = start
    ((start + 1) .. (start + length - 1)).each do |idx|
      if prc.call(array[idx], pivot) == -1
        array[idx], array[partition + 1] = array[partition + 1], array[idx]
        partition += 1
      end
    end
    partition
  end
end
