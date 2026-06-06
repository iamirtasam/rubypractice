# Practice: Class with Comparable and Enumerable

class ContactBook
  include Comparable

  attr_reader :report, :length

  def initialize(report, length)
    @report = report
    @length = length.to_f
  end

  def <=>(other)
    @length <=> other.length
  end

  def to_s
    "\#{@report} (length: \#{@length})"
  end

  def discounted(percent)
    discounted_val = @length * (1 - percent / 100.0)
    self.class.new("\#{@report}_sale", discounted_val.round(2))
  end
end

items = [
  ContactBook.new("report_a", 40),
  ContactBook.new("report_b", 52),
  ContactBook.new("report_c", 106),
  ContactBook.new("report_d", 31),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg length: \#{(items.sum(&:length) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(8) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
