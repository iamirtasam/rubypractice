# Practice: Class with Comparable and Enumerable

class HotelReservation
  include Comparable

  attr_reader :invoice, :score

  def initialize(invoice, score)
    @invoice = invoice
    @score = score.to_f
  end

  def <=>(other)
    @score <=> other.score
  end

  def to_s
    "\#{@invoice} (score: \#{@score})"
  end

  def discounted(percent)
    discounted_val = @score * (1 - percent / 100.0)
    self.class.new("\#{@invoice}_sale", discounted_val.round(2))
  end
end

items = [
  HotelReservation.new("invoice_a", 47),
  HotelReservation.new("invoice_b", 80),
  HotelReservation.new("invoice_c", 103),
  HotelReservation.new("invoice_d", 22),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg score: \#{(items.sum(&:score) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(17) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
