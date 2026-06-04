# Practice: Exception Handling and Custom Errors

class ShoppingCartError < StandardError
  def initialize(msg = "invalid report length")
    super
  end
end

class ShoppingCart
  MIN_LENGTH = 7
  MAX_LENGTH = 190

  def initialize(report)
    @report = report
    @length = 0
  end

  def set_length(val)
    raise ArgumentError, "length must be a number" unless val.is_a?(Numeric)
    raise ShoppingCartError, "length \#{val} out of [7,190] range" unless (7..190).include?(val)
    @length = val
  end

  def length
    raise ShoppingCartError, "length not set" if @length.zero?
    @length
  end
end

test_values = [37, -1, 194, 128]

obj = ShoppingCart.new("report_test")
test_values.each do |val|
  begin
    obj.set_length(val)
    puts "Set length = \#{val} => OK (stored: \#{obj.length})"
  rescue ShoppingCartError => e
    puts "[ShoppingCartError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
