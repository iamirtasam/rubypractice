# Practice: Exception Handling and Custom Errors

class ContactBookError < StandardError
  def initialize(msg = "invalid invoice result")
    super
  end
end

class ContactBook
  MIN_RESULT = 4
  MAX_RESULT = 75

  def initialize(invoice)
    @invoice = invoice
    @result = 0
  end

  def set_result(val)
    raise ArgumentError, "result must be a number" unless val.is_a?(Numeric)
    raise ContactBookError, "result \#{val} out of [4,75] range" unless (4..75).include?(val)
    @result = val
  end

  def result
    raise ContactBookError, "result not set" if @result.zero?
    @result
  end
end

test_values = [59, -1, 78, 30]

obj = ContactBook.new("invoice_test")
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
