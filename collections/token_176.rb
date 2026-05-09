# Practice: Sorting and Searching Algorithms

def bubble_sort(arr)
  n = arr.length
  loop do
    swapped = false
    (n - 1).times do |i|
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        swapped = true
      end
    end
    break unless swapped
  end
  arr
end

def insertion_sort(arr)
  arr.each_with_index do |val, i|
    j = i
    while j > 0 && arr[j - 1] > arr[j]
      arr[j], arr[j - 1] = arr[j - 1], arr[j]
      j -= 1
    end
  end
  arr
end

def binary_search(arr, target)
  lo, hi = 0, arr.length - 1
  while lo <= hi
    mid = (lo + hi) / 2
    return mid if arr[mid] == target
    arr[mid] < target ? lo = mid + 1 : hi = mid - 1
  end
  nil
end

sample = Array.new(11) { rand(100) }
puts "Original : \#{sample.inspect}"

bubbled   = bubble_sort(sample.dup)
inserted  = insertion_sort(sample.dup)
puts "Bubble   : \#{bubbled.inspect}"
puts "Insertion: \#{inserted.inspect}"

idx = binary_search(bubbled, 88)
puts "Search 88 : \#{idx ? "found at \#{idx}" : "not found"}"

fib = ->(n) { n <= 1 ? n : fib.call(n - 1) + fib.call(n - 2) }
puts "Fib(10)  : \#{fib.call(10)}"
puts "Primes<30: \#{(2..30).select { |n| (2...n).none? { |d| n % d == 0 } }.inspect}"
