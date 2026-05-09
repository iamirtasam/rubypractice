# Practice: Exception Handling and Custom Errors

class VendingMachineError < StandardError
  def initialize(msg = "invalid account score")
    super
  end
end

class VendingMachine
  MIN_SCORE = 1
  MAX_SCORE = 128

  def initialize(account)
    @account = account
    @score = 0
  end

  def set_score(val)
    raise ArgumentError, "score must be a number" unless val.is_a?(Numeric)
    raise VendingMachineError, "score \#{val} out of [1,128] range" unless (1..128).include?(val)
    @score = val
  end

  def score
    raise VendingMachineError, "score not set" if @score.zero?
    @score
  end
end

test_values = [99, -1, 155, 117]

obj = VendingMachine.new("account_test")
test_values.each do |val|
  begin
    obj.set_score(val)
    puts "Set score = \#{val} => OK (stored: \#{obj.score})"
  rescue VendingMachineError => e
    puts "[VendingMachineError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
