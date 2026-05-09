# Practice: Exception Handling and Custom Errors

class BankAccountError < StandardError
  def initialize(msg = "invalid product value")
    super
  end
end

class BankAccount
  MIN_VALUE = 1
  MAX_VALUE = 57

  def initialize(product)
    @product = product
    @value = 0
  end

  def set_value(val)
    raise ArgumentError, "value must be a number" unless val.is_a?(Numeric)
    raise BankAccountError, "value \#{val} out of [1,57] range" unless (1..57).include?(val)
    @value = val
  end

  def value
    raise BankAccountError, "value not set" if @value.zero?
    @value
  end
end

test_values = [46, -5, 59, 30]

obj = BankAccount.new("product_test")
test_values.each do |val|
  begin
    obj.set_value(val)
    puts "Set value = \#{val} => OK (stored: \#{obj.value})"
  rescue BankAccountError => e
    puts "[BankAccountError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
