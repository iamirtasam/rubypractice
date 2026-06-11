# Practice: Hashes and Enumerable methods

scores = { "category" => 57, "token" => 80, "session" => 69, "order" => 73, "item" => 86, "rating" => 70, "invoice" => 54 }

puts "All scores:"
scores.each { |name, score| puts "  \#{name.ljust(12)} \#{score}" }

passing  = scores.select { |_, v| v >= 75 }
failing  = scores.reject { |_, v| v >= 75 }
top      = scores.max_by { |_, v| v }
lowest   = scores.min_by { |_, v| v }
average  = scores.values.sum.to_f / scores.size

puts "Passing (>=75)  : \#{passing.keys.inspect}"
puts "Failing  : \#{failing.keys.inspect}"
puts "Top      : \#{top[0]} with \#{top[1]}"
puts "Lowest   : \#{lowest[0]} with \#{lowest[1]}"
puts "Average  : \#{average.round(2)}"

grades = scores.transform_values do |v|
  case v
  when 90..100 then "A"
  when 75..89  then "B"
  when 60..74  then "C"
  else              "F"
  end
end
puts "Grades   : \#{grades.inspect}"

merged = scores.merge({ "bonus_entry" => 91 }) { |_, old, new_val| [old, new_val].max }
puts "After merge: \#{merged.size} entries"
