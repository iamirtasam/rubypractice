# Practice: Exception Handling and Custom Errors

class ShoppingCartError < StandardError
  def initialize(msg = "invalid invoice weight")
    super
  end
end

class ShoppingCart
  MIN_WEIGHT = 4
  MAX_WEIGHT = 171

  def initialize(invoice)
    @invoice = invoice
    @weight = 0
  end

  def set_weight(val)
    raise ArgumentError, "weight must be a number" unless val.is_a?(Numeric)
    raise ShoppingCartError, "weight \#{val} out of [4,171] range" unless (4..171).include?(val)
    @weight = val
  end

  def weight
    raise ShoppingCartError, "weight not set" if @weight.zero?
    @weight
  end
end

test_values = [63, -4, 210, 146]

obj = ShoppingCart.new("invoice_test")
test_values.each do |val|
  begin
    obj.set_weight(val)
    puts "Set weight = \#{val} => OK (stored: \#{obj.weight})"
  rescue ShoppingCartError => e
    puts "[ShoppingCartError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
