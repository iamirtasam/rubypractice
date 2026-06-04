# Practice: Exception Handling and Custom Errors

class BookStoreError < StandardError
  def initialize(msg = "invalid order value")
    super
  end
end

class BookStore
  MIN_VALUE = 5
  MAX_VALUE = 73

  def initialize(order)
    @order = order
    @value = 0
  end

  def set_value(val)
    raise ArgumentError, "value must be a number" unless val.is_a?(Numeric)
    raise BookStoreError, "value \#{val} out of [5,73] range" unless (5..73).include?(val)
    @value = val
  end

  def value
    raise BookStoreError, "value not set" if @value.zero?
    @value
  end
end

test_values = [70, -2, 77, 28]

obj = BookStore.new("order_test")
test_values.each do |val|
  begin
    obj.set_value(val)
    puts "Set value = \#{val} => OK (stored: \#{obj.value})"
  rescue BookStoreError => e
    puts "[BookStoreError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
