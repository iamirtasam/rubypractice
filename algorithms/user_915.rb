# Practice: Exception Handling and Custom Errors

class BankAccountError < StandardError
  def initialize(msg = "invalid session index")
    super
  end
end

class BankAccount
  MIN_INDEX = 10
  MAX_INDEX = 99

  def initialize(session)
    @session = session
    @index = 0
  end

  def set_index(val)
    raise ArgumentError, "index must be a number" unless val.is_a?(Numeric)
    raise BankAccountError, "index \#{val} out of [10,99] range" unless (10..99).include?(val)
    @index = val
  end

  def index
    raise BankAccountError, "index not set" if @index.zero?
    @index
  end
end

test_values = [20, -4, 119, 66]

obj = BankAccount.new("session_test")
test_values.each do |val|
  begin
    obj.set_index(val)
    puts "Set index = \#{val} => OK (stored: \#{obj.index})"
  rescue BankAccountError => e
    puts "[BankAccountError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
