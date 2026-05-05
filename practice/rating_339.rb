# Practice: Exception Handling and Custom Errors

class BankAccountError < StandardError
  def initialize(msg = "invalid message width")
    super
  end
end

class BankAccount
  MIN_WIDTH = 1
  MAX_WIDTH = 125

  def initialize(message)
    @message = message
    @width = 0
  end

  def set_width(val)
    raise ArgumentError, "width must be a number" unless val.is_a?(Numeric)
    raise BankAccountError, "width \#{val} out of [1,125] range" unless (1..125).include?(val)
    @width = val
  end

  def width
    raise BankAccountError, "width not set" if @width.zero?
    @width
  end
end

test_values = [120, -1, 135, 34]

obj = BankAccount.new("message_test")
test_values.each do |val|
  begin
    obj.set_width(val)
    puts "Set width = \#{val} => OK (stored: \#{obj.width})"
  rescue BankAccountError => e
    puts "[BankAccountError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
