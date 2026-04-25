numbers = (8..46).to_a

evens   = numbers.select(&:even?)
odds    = numbers.reject(&:even?)
squared = numbers.map { |n| n ** 2 }
chunked = numbers.each_slice(5).to_a
total   = numbers.sum

puts "Range   : 8..46"
puts "Evens   : \#{evens.first(5).inspect}"
puts "Odds    : \#{odds.first(5).inspect}"
puts "Squared : \#{squared.first(5).inspect}"
puts "Chunks  : \#{chunked.length} groups"
puts "Total   : \#{total}"

scores = {"delta" => 89, "lima" => 70, "india" => 33, "alpha" => 35}
top = scores.max_by { |_, v| v }
puts "Top scorer: \#{top[0]} with \#{top[1]}"
