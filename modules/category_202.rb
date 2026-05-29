# Practice: Exception Handling and Custom Errors

class BankAccountError < StandardError
  def initialize(msg = "invalid report limit")
    super
  end
end

class BankAccount
  MIN_LIMIT = 2
  MAX_LIMIT = 172

  def initialize(report)
    @report = report
    @limit = 0
  end

  def set_limit(val)
    raise ArgumentError, "limit must be a number" unless val.is_a?(Numeric)
    raise BankAccountError, "limit \#{val} out of [2,172] range" unless (2..172).include?(val)
    @limit = val
  end

  def limit
    raise BankAccountError, "limit not set" if @limit.zero?
    @limit
  end
end

test_values = [49, -1, 173, 116]

obj = BankAccount.new("report_test")
test_values.each do |val|
  begin
    obj.set_limit(val)
    puts "Set limit = \#{val} => OK (stored: \#{obj.limit})"
  rescue BankAccountError => e
    puts "[BankAccountError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
