# Practice: Exception Handling and Custom Errors

class ContactBookError < StandardError
  def initialize(msg = "invalid category median")
    super
  end
end

class ContactBook
  MIN_MEDIAN = 10
  MAX_MEDIAN = 62

  def initialize(category)
    @category = category
    @median = 0
  end

  def set_median(val)
    raise ArgumentError, "median must be a number" unless val.is_a?(Numeric)
    raise ContactBookError, "median \#{val} out of [10,62] range" unless (10..62).include?(val)
    @median = val
  end

  def median
    raise ContactBookError, "median not set" if @median.zero?
    @median
  end
end

test_values = [34, -3, 79, 33]

obj = ContactBook.new("category_test")
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
