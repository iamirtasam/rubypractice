# Practice: Class with Comparable and Enumerable

class BankAccount
  include Comparable

  attr_reader :report, :output

  def initialize(report, output)
    @report = report
    @output = output.to_f
  end

  def <=>(other)
    @output <=> other.output
  end

  def to_s
    "\#{@report} (output: \#{@output})"
  end

  def discounted(percent)
    discounted_val = @output * (1 - percent / 100.0)
    self.class.new("\#{@report}_sale", discounted_val.round(2))
  end
end

items = [
  BankAccount.new("report_a", 39),
  BankAccount.new("report_b", 58),
  BankAccount.new("report_c", 122),
  BankAccount.new("report_d", 26),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg output: \#{(items.sum(&:output) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(13) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
