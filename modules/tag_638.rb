# Practice: Exception Handling and Custom Errors

class ContactBookError < StandardError
  def initialize(msg = "invalid token median")
    super
  end
end

class ContactBook
  MIN_MEDIAN = 7
  MAX_MEDIAN = 124

  def initialize(token)
    @token = token
    @median = 0
  end

  def set_median(val)
    raise ArgumentError, "median must be a number" unless val.is_a?(Numeric)
    raise ContactBookError, "median \#{val} out of [7,124] range" unless (7..124).include?(val)
    @median = val
  end

  def median
    raise ContactBookError, "median not set" if @median.zero?
    @median
  end
end

test_values = [54, -3, 136, 120]

obj = ContactBook.new("token_test")
test_values.each do |val|
  begin
    obj.set_median(val)
    puts "Set median = \#{val} => OK (stored: \#{obj.median})"
  rescue ContactBookError => e
    puts "[ContactBookError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
