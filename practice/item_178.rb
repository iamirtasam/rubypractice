# Practice: Hashes and Enumerable methods

scores = { "rating" => 60, "report" => 53, "session" => 96, "order" => 93, "record" => 59, "product" => 94, "tag" => 80 }

puts "All scores:"
scores.each { |name, score| puts "  \#{name.ljust(12)} \#{score}" }

passing  = scores.select { |_, v| v >= 77 }
failing  = scores.reject { |_, v| v >= 77 }
top      = scores.max_by { |_, v| v }
lowest   = scores.min_by { |_, v| v }
average  = scores.values.sum.to_f / scores.size

puts "Passing (>=77)  : \#{passing.keys.inspect}"
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

merged = scores.merge({ "bonus_entry" => 98 }) { |_, old, new_val| [old, new_val].max }
puts "After merge: \#{merged.size} entries"
