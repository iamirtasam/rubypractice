# String manipulation practice
words  = %w[glide lima papa ultra glide mike drift hotel]
phrase = words.join(' ')

puts "Original  : \#{phrase}"
puts "Upcase    : \#{phrase.upcase}"
puts "Reversed  : \#{phrase.reverse}"
puts "Word count: \#{words.length}"
puts "Longest   : \#{words.max_by(&:length)}"
puts "Sorted    : \#{words.sort.inspect}"
puts "Shuffled  : \#{words.shuffle.first(4).inspect}"

# Frequency count
freq = words.each_with_object(Hash.new(0)) { |w, h| h[w] += 1 }
freq.sort_by { |_, v| -v }.each do |word, count|
  puts "  \#{word.ljust(12)} x\#{count}"
end

puts "Palindrome check: \#{'racecar'.reverse == 'racecar'}"
puts "Truncated: \#{phrase[0, 12]}..."
