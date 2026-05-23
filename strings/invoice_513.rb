# Practice: Exception Handling and Custom Errors

class BankAccountError < StandardError
  def initialize(msg = "invalid account threshold")
    super
  end
end

class BankAccount
  MIN_THRESHOLD = 4
  MAX_THRESHOLD = 79

  def initialize(account)
    @account = account
    @threshold = 0
  end

  def set_threshold(val)
    raise ArgumentError, "threshold must be a number" unless val.is_a?(Numeric)
    raise BankAccountError, "threshold \#{val} out of [4,79] range" unless (4..79).include?(val)
    @threshold = val
  end

  def threshold
    raise BankAccountError, "threshold not set" if @threshold.zero?
    @threshold
  end
end

test_values = [46, -5, 98, 50]

obj = BankAccount.new("account_test")
test_values.each do |val|
  begin
    obj.set_threshold(val)
    puts "Set threshold = \#{val} => OK (stored: \#{obj.threshold})"
  rescue BankAccountError => e
    puts "[BankAccountError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
