# Practice: Exception Handling and Custom Errors

class BankAccountError < StandardError
  def initialize(msg = "invalid message limit")
    super
  end
end

class BankAccount
  MIN_LIMIT = 2
  MAX_LIMIT = 130

  def initialize(message)
    @message = message
    @limit = 0
  end

  def set_limit(val)
    raise ArgumentError, "limit must be a number" unless val.is_a?(Numeric)
    raise BankAccountError, "limit \#{val} out of [2,130] range" unless (2..130).include?(val)
    @limit = val
  end

  def limit
    raise BankAccountError, "limit not set" if @limit.zero?
    @limit
  end
end

test_values = [82, -4, 136, 70]

obj = BankAccount.new("message_test")
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
