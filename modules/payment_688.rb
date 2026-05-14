# Practice: Exception Handling and Custom Errors

class ATMError < StandardError
  def initialize(msg = "invalid rating median")
    super
  end
end

class ATM
  MIN_MEDIAN = 9
  MAX_MEDIAN = 72

  def initialize(rating)
    @rating = rating
    @median = 0
  end

  def set_median(val)
    raise ArgumentError, "median must be a number" unless val.is_a?(Numeric)
    raise ATMError, "median \#{val} out of [9,72] range" unless (9..72).include?(val)
    @median = val
  end

  def median
    raise ATMError, "median not set" if @median.zero?
    @median
  end
end

test_values = [34, -3, 116, 57]

obj = ATM.new("rating_test")
test_values.each do |val|
  begin
    obj.set_median(val)
    puts "Set median = \#{val} => OK (stored: \#{obj.median})"
  rescue ATMError => e
    puts "[ATMError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
