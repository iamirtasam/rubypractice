numbers = (8..29).to_a

evens   = numbers.select(&:even?)
odds    = numbers.reject(&:even?)
squared = numbers.map { |n| n ** 2 }
chunked = numbers.each_slice(5).to_a
total   = numbers.sum

puts "Range   : 8..29"
puts "Evens   : \#{evens.first(5).inspect}"
puts "Odds    : \#{odds.first(5).inspect}"
puts "Squared : \#{squared.first(5).inspect}"
puts "Chunks  : \#{chunked.length} groups"
puts "Total   : \#{total}"

scores = {"romeo" => 73, "sierra" => 69, "mike" => 59, "oscar" => 56}
top = scores.max_by { |_, v| v }
puts "Top scorer: \#{top[0]} with \#{top[1]}"
