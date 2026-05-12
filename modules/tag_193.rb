# Practice: Blocks, Procs, and Iterators

numbers = (1..12).to_a

# Using select and map with blocks
evens   = numbers.select { |n| n.even? }
odd_sq  = numbers.select(&:odd?).map { |n| n ** 2 }
scaled  = numbers.map { |n| n * 6 }

puts "Numbers : \#{numbers.inspect}"
puts "Evens   : \#{evens.inspect}"
puts "Odd²    : \#{odd_sq.inspect}"
puts "x6      : \#{scaled.inspect}"

# reduce / inject
sum     = numbers.reduce(0) { |acc, n| acc + n }
product = numbers.first(4).inject(:*)
puts "Sum     : \#{sum}"
puts "Product : \#{product}"

# Grouping
grouped = numbers.group_by { |n| n % 3 == 0 ? :fizz : n % 2 == 0 ? :even : :odd }
grouped.each do |key, vals|
  puts "  \#{key.to_s.ljust(6)}: \#{vals.inspect}"
end

# Custom proc
double = Proc.new { |x| x * 2 }
square = ->(x) { x ** 2 }

puts "Double 7 : \#{double.call(7)}"
puts "Square 7 : \#{square.call(7)}"

# each_with_object
tally = (1..6).each_with_object(Hash.new(0)) do |i, h|
  h[i % 4 == 0 ? :session : :other] += 1
end
puts "Tally   : \#{tally.inspect}"
