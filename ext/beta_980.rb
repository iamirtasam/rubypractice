numbers = (3..43).to_a

evens   = numbers.select(&:even?)
odds    = numbers.reject(&:even?)
squared = numbers.map { |n| n ** 2 }
chunked = numbers.each_slice(4).to_a
total   = numbers.sum

puts "Range   : 3..43"
puts "Evens   : \#{evens.first(5).inspect}"
puts "Odds    : \#{odds.first(5).inspect}"
puts "Squared : \#{squared.first(5).inspect}"
puts "Chunks  : \#{chunked.length} groups"
puts "Total   : \#{total}"

scores = {"blaze" => 86, "gamma" => 18, "cedar" => 52, "victor" => 70}
top = scores.max_by { |_, v| v }
puts "Top scorer: \#{top[0]} with \#{top[1]}"
