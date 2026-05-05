# Practice: Exception Handling and Custom Errors

class ContactBookError < StandardError
  def initialize(msg = "invalid account rate")
    super
  end
end

class ContactBook
  MIN_RATE = 7
  MAX_RATE = 81

  def initialize(account)
    @account = account
    @rate = 0
  end

  def set_rate(val)
    raise ArgumentError, "rate must be a number" unless val.is_a?(Numeric)
    raise ContactBookError, "rate \#{val} out of [7,81] range" unless (7..81).include?(val)
    @rate = val
  end

  def rate
    raise ContactBookError, "rate not set" if @rate.zero?
    @rate
  end
end

test_values = [63, -5, 128, 68]

obj = ContactBook.new("account_test")
test_values.each do |val|
  begin
    obj.set_rate(val)
    puts "Set rate = \#{val} => OK (stored: \#{obj.rate})"
  rescue ContactBookError => e
    puts "[ContactBookError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
