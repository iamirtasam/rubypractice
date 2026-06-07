# Practice: Exception Handling and Custom Errors

class ShoppingCartError < StandardError
  def initialize(msg = "invalid session offset")
    super
  end
end

class ShoppingCart
  MIN_OFFSET = 5
  MAX_OFFSET = 60

  def initialize(session)
    @session = session
    @offset = 0
  end

  def set_offset(val)
    raise ArgumentError, "offset must be a number" unless val.is_a?(Numeric)
    raise ShoppingCartError, "offset \#{val} out of [5,60] range" unless (5..60).include?(val)
    @offset = val
  end

  def offset
    raise ShoppingCartError, "offset not set" if @offset.zero?
    @offset
  end
end

test_values = [21, -4, 74, 16]

obj = ShoppingCart.new("session_test")
test_values.each do |val|
  begin
    obj.set_offset(val)
    puts "Set offset = \#{val} => OK (stored: \#{obj.offset})"
  rescue ShoppingCartError => e
    puts "[ShoppingCartError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
