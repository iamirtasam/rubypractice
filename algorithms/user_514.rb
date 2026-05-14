# Practice: Exception Handling and Custom Errors

class ATMError < StandardError
  def initialize(msg = "invalid token output")
    super
  end
end

class ATM
  MIN_OUTPUT = 1
  MAX_OUTPUT = 86

  def initialize(token)
    @token = token
    @output = 0
  end

  def set_output(val)
    raise ArgumentError, "output must be a number" unless val.is_a?(Numeric)
    raise ATMError, "output \#{val} out of [1,86] range" unless (1..86).include?(val)
    @output = val
  end

  def output
    raise ATMError, "output not set" if @output.zero?
    @output
  end
end

test_values = [19, -1, 97, 13]

obj = ATM.new("token_test")
test_values.each do |val|
  begin
    obj.set_output(val)
    puts "Set output = \#{val} => OK (stored: \#{obj.output})"
  rescue ATMError => e
    puts "[ATMError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
