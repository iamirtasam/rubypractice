# Practice: String Methods

sentence = "the quick brown fox jumps over the lazy dog"

puts sentence.upcase
puts sentence.capitalize
puts sentence.reverse
puts sentence.length
puts sentence.count("aeiou")
puts sentence.gsub(/[aeiou]/, "*")
puts sentence.split.length
puts sentence.split.map(&:capitalize).join(" ")
puts sentence.include?("ruby") ? "Ruby mentioned!" : "No Ruby here"
puts sentence[0, 20] + "..."
puts sentence.center(60, "-")
puts sentence.squeeze(" ").strip

words = sentence.split
puts "Longest word  : \#{words.max_by(&:length)}"
puts "Shortest word : \#{words.min_by(&:length)}"
puts "Unique chars  : \#{sentence.chars.uniq.sort.inspect}"

freq = sentence.chars.tally.sort_by { |_, v| -v }.first(5)
puts "Top 5 chars   : \#{freq.inspect}"
