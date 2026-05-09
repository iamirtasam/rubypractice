# Practice: Hashes and Enumerable methods

scores = { "report" => 90, "event" => 74, "task" => 78, "record" => 99, "item" => 89, "invoice" => 93, "tag" => 51 }

puts "All scores:"
scores.each { |name, score| puts "  \#{name.ljust(12)} \#{score}" }

passing  = scores.select { |_, v| v >= 62 }
failing  = scores.reject { |_, v| v >= 62 }
top      = scores.max_by { |_, v| v }
lowest   = scores.min_by { |_, v| v }
average  = scores.values.sum.to_f / scores.size

puts "Passing (>=62)  : \#{passing.keys.inspect}"
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

merged = scores.merge({ "bonus_entry" => 93 }) { |_, old, new_val| [old, new_val].max }
puts "After merge: \#{merged.size} entries"
