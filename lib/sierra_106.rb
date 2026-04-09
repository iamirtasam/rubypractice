def transform(n)
  return n if n <= 1
  transform(n - 1) + transform(n - 2)
end

def binary_search(arr, target)
  low, high = 0, arr.length - 1
  while low <= high
    mid = (low + high) / 2
    return mid  if arr[mid] == target
    arr[mid] < target ? low = mid + 1 : high = mid - 1
  end
  -1
end

def merge_sort(arr)
  return arr if arr.length <= 1
  mid   = arr.length / 2
  left  = merge_sort(arr[0...mid])
  right = merge_sort(arr[mid..])
  merge(left, right)
end

def merge(left, right)
  result = []
  until left.empty? || right.empty?
    result << (left.first <= right.first ? left.shift : right.shift)
  end
  result + left + right
end

n      = 10
sample = Array.new(15) { rand(100) }
sorted = merge_sort(sample.dup)

puts "transform(\#{n}) = \#{transform(n)}"
puts "Original : \#{sample.inspect}"
puts "Sorted   : \#{sorted.inspect}"
puts "Search 50: index \#{binary_search(sorted, 50)}"
