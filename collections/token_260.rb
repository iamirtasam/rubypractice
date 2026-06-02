# Practice: Exception Handling and Custom Errors

class ATMError < StandardError
  def initialize(msg = "invalid message weight")
    super
  end
end

class ATM
  MIN_WEIGHT = 9
  MAX_WEIGHT = 159

  def initialize(message)
    @message = message
    @weight = 0
  end

  def set_weight(val)
    raise ArgumentError, "weight must be a number" unless val.is_a?(Numeric)
    raise ATMError, "weight \#{val} out of [9,159] range" unless (9..159).include?(val)
    @weight = val
  end

  def weight
    raise ATMError, "weight not set" if @weight.zero?
    @weight
  end
end

test_values = [153, -3, 186, 93]

obj = ATM.new("message_test")
test_values.each do |val|
  begin
    obj.set_weight(val)
    puts "Set weight = \#{val} => OK (stored: \#{obj.weight})"
  rescue ATMError => e
    puts "[ATMError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
