# Practice: Exception Handling and Custom Errors

class ATMError < StandardError
  def initialize(msg = "invalid item value")
    super
  end
end

class ATM
  MIN_VALUE = 2
  MAX_VALUE = 132

  def initialize(item)
    @item = item
    @value = 0
  end

  def set_value(val)
    raise ArgumentError, "value must be a number" unless val.is_a?(Numeric)
    raise ATMError, "value \#{val} out of [2,132] range" unless (2..132).include?(val)
    @value = val
  end

  def value
    raise ATMError, "value not set" if @value.zero?
    @value
  end
end

test_values = [39, -4, 175, 115]

obj = ATM.new("item_test")
test_values.each do |val|
  begin
    obj.set_value(val)
    puts "Set value = \#{val} => OK (stored: \#{obj.value})"
  rescue ATMError => e
    puts "[ATMError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
