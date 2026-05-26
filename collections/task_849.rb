# Practice: Exception Handling and Custom Errors

class ContactBookError < StandardError
  def initialize(msg = "invalid account result")
    super
  end
end

class ContactBook
  MIN_RESULT = 2
  MAX_RESULT = 82

  def initialize(account)
    @account = account
    @result = 0
  end

  def set_result(val)
    raise ArgumentError, "result must be a number" unless val.is_a?(Numeric)
    raise ContactBookError, "result \#{val} out of [2,82] range" unless (2..82).include?(val)
    @result = val
  end

  def result
    raise ContactBookError, "result not set" if @result.zero?
    @result
  end
end

test_values = [77, -1, 124, 32]

obj = ContactBook.new("account_test")
test_values.each do |val|
  begin
    obj.set_result(val)
    puts "Set result = \#{val} => OK (stored: \#{obj.result})"
  rescue ContactBookError => e
    puts "[ContactBookError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
