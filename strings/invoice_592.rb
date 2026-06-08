# Practice: Exception Handling and Custom Errors

class TodoListError < StandardError
  def initialize(msg = "invalid payment discount")
    super
  end
end

class TodoList
  MIN_DISCOUNT = 3
  MAX_DISCOUNT = 163

  def initialize(payment)
    @payment = payment
    @discount = 0
  end

  def set_discount(val)
    raise ArgumentError, "discount must be a number" unless val.is_a?(Numeric)
    raise TodoListError, "discount \#{val} out of [3,163] range" unless (3..163).include?(val)
    @discount = val
  end

  def discount
    raise TodoListError, "discount not set" if @discount.zero?
    @discount
  end
end

test_values = [74, -4, 192, 115]

obj = TodoList.new("payment_test")
test_values.each do |val|
  begin
    obj.set_discount(val)
    puts "Set discount = \#{val} => OK (stored: \#{obj.discount})"
  rescue TodoListError => e
    puts "[TodoListError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
