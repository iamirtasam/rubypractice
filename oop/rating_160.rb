# Practice: Exception Handling and Custom Errors

class BankAccountError < StandardError
  def initialize(msg = "invalid token output")
    super
  end
end

class BankAccount
  MIN_OUTPUT = 6
  MAX_OUTPUT = 131

  def initialize(token)
    @token = token
    @output = 0
  end

  def set_output(val)
    raise ArgumentError, "output must be a number" unless val.is_a?(Numeric)
    raise BankAccountError, "output \#{val} out of [6,131] range" unless (6..131).include?(val)
    @output = val
  end

  def output
    raise BankAccountError, "output not set" if @output.zero?
    @output
  end
end

test_values = [80, -5, 142, 24]

obj = BankAccount.new("token_test")
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
