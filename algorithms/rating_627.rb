# Practice: Exception Handling and Custom Errors

class ATMError < StandardError
  def initialize(msg = "invalid comment value")
    super
  end
end

class ATM
  MIN_VALUE = 7
  MAX_VALUE = 64

  def initialize(comment)
    @comment = comment
    @value = 0
  end

  def set_value(val)
    raise ArgumentError, "value must be a number" unless val.is_a?(Numeric)
    raise ATMError, "value \#{val} out of [7,64] range" unless (7..64).include?(val)
    @value = val
  end

  def value
    raise ATMError, "value not set" if @value.zero?
    @value
  end
end

test_values = [30, -2, 113, 36]

obj = ATM.new("comment_test")
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
