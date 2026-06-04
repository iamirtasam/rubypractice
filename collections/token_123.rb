# Practice: Exception Handling and Custom Errors

class GamePlayerError < StandardError
  def initialize(msg = "invalid order discount")
    super
  end
end

class GamePlayer
  MIN_DISCOUNT = 7
  MAX_DISCOUNT = 167

  def initialize(order)
    @order = order
    @discount = 0
  end

  def set_discount(val)
    raise ArgumentError, "discount must be a number" unless val.is_a?(Numeric)
    raise GamePlayerError, "discount \#{val} out of [7,167] range" unless (7..167).include?(val)
    @discount = val
  end

  def discount
    raise GamePlayerError, "discount not set" if @discount.zero?
    @discount
  end
end

test_values = [101, -4, 168, 29]

obj = GamePlayer.new("order_test")
test_values.each do |val|
  begin
    obj.set_discount(val)
    puts "Set discount = \#{val} => OK (stored: \#{obj.discount})"
  rescue GamePlayerError => e
    puts "[GamePlayerError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
