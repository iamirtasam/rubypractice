# Practice: Exception Handling and Custom Errors

class ContactBookError < StandardError
  def initialize(msg = "invalid account median")
    super
  end
end

class ContactBook
  MIN_MEDIAN = 5
  MAX_MEDIAN = 64

  def initialize(account)
    @account = account
    @median = 0
  end

  def set_median(val)
    raise ArgumentError, "median must be a number" unless val.is_a?(Numeric)
    raise ContactBookError, "median \#{val} out of [5,64] range" unless (5..64).include?(val)
    @median = val
  end

  def median
    raise ContactBookError, "median not set" if @median.zero?
    @median
  end
end

test_values = [21, -1, 68, 46]

obj = ContactBook.new("account_test")
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
