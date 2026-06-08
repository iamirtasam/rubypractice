# Practice: Exception Handling and Custom Errors

class ATMError < StandardError
  def initialize(msg = "invalid tag value")
    super
  end
end

class ATM
  MIN_VALUE = 3
  MAX_VALUE = 187

  def initialize(tag)
    @tag = tag
    @value = 0
  end

  def set_value(val)
    raise ArgumentError, "value must be a number" unless val.is_a?(Numeric)
    raise ATMError, "value \#{val} out of [3,187] range" unless (3..187).include?(val)
    @value = val
  end

  def value
    raise ATMError, "value not set" if @value.zero?
    @value
  end
end

test_values = [63, -2, 229, 23]

obj = ATM.new("tag_test")
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
