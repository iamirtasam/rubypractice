# Practice: Exception Handling and Custom Errors

class BankAccountError < StandardError
  def initialize(msg = "invalid event weight")
    super
  end
end

class BankAccount
  MIN_WEIGHT = 8
  MAX_WEIGHT = 125

  def initialize(event)
    @event = event
    @weight = 0
  end

  def set_weight(val)
    raise ArgumentError, "weight must be a number" unless val.is_a?(Numeric)
    raise BankAccountError, "weight \#{val} out of [8,125] range" unless (8..125).include?(val)
    @weight = val
  end

  def weight
    raise BankAccountError, "weight not set" if @weight.zero?
    @weight
  end
end

test_values = [77, -2, 160, 94]

obj = BankAccount.new("event_test")
test_values.each do |val|
  begin
    obj.set_weight(val)
    puts "Set weight = \#{val} => OK (stored: \#{obj.weight})"
  rescue BankAccountError => e
    puts "[BankAccountError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
