numbers = (7..42).to_a

evens   = numbers.select(&:even?)
odds    = numbers.reject(&:even?)
squared = numbers.map { |n| n ** 2 }
chunked = numbers.each_slice(5).to_a
total   = numbers.sum

puts "Range   : 7..42"
puts "Evens   : \#{evens.first(5).inspect}"
puts "Odds    : \#{odds.first(5).inspect}"
puts "Squared : \#{squared.first(5).inspect}"
puts "Chunks  : \#{chunked.length} groups"
puts "Total   : \#{total}"

scores = {"victor" => 77, "frost" => 90, "alpha" => 12, "beta" => 82}
top = scores.max_by { |_, v| v }
puts "Top scorer: \#{top[0]} with \#{top[1]}"
