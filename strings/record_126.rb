# Practice: Exception Handling and Custom Errors

class BankAccountError < StandardError
  def initialize(msg = "invalid event output")
    super
  end
end

class BankAccount
  MIN_OUTPUT = 3
  MAX_OUTPUT = 65

  def initialize(event)
    @event = event
    @output = 0
  end

  def set_output(val)
    raise ArgumentError, "output must be a number" unless val.is_a?(Numeric)
    raise BankAccountError, "output \#{val} out of [3,65] range" unless (3..65).include?(val)
    @output = val
  end

  def output
    raise BankAccountError, "output not set" if @output.zero?
    @output
  end
end

test_values = [26, -4, 75, 53]

obj = BankAccount.new("event_test")
test_values.each do |val|
  begin
    obj.set_output(val)
    puts "Set output = \#{val} => OK (stored: \#{obj.output})"
  rescue BankAccountError => e
    puts "[BankAccountError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
