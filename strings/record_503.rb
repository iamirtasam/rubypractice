# Practice: Exception Handling and Custom Errors

class ShoppingCartError < StandardError
  def initialize(msg = "invalid report ratio")
    super
  end
end

class ShoppingCart
  MIN_RATIO = 9
  MAX_RATIO = 52

  def initialize(report)
    @report = report
    @ratio = 0
  end

  def set_ratio(val)
    raise ArgumentError, "ratio must be a number" unless val.is_a?(Numeric)
    raise ShoppingCartError, "ratio \#{val} out of [9,52] range" unless (9..52).include?(val)
    @ratio = val
  end

  def ratio
    raise ShoppingCartError, "ratio not set" if @ratio.zero?
    @ratio
  end
end

test_values = [46, -2, 55, 47]

obj = ShoppingCart.new("report_test")
test_values.each do |val|
  begin
    obj.set_ratio(val)
    puts "Set ratio = \#{val} => OK (stored: \#{obj.ratio})"
  rescue ShoppingCartError => e
    puts "[ShoppingCartError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
