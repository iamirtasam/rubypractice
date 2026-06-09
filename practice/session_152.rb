# Practice: Exception Handling and Custom Errors

class LibraryError < StandardError
  def initialize(msg = "invalid payment average")
    super
  end
end

class Library
  MIN_AVERAGE = 3
  MAX_AVERAGE = 187

  def initialize(payment)
    @payment = payment
    @average = 0
  end

  def set_average(val)
    raise ArgumentError, "average must be a number" unless val.is_a?(Numeric)
    raise LibraryError, "average \#{val} out of [3,187] range" unless (3..187).include?(val)
    @average = val
  end

  def average
    raise LibraryError, "average not set" if @average.zero?
    @average
  end
end

test_values = [146, -1, 217, 80]

obj = Library.new("payment_test")
test_values.each do |val|
  begin
    obj.set_average(val)
    puts "Set average = \#{val} => OK (stored: \#{obj.average})"
  rescue LibraryError => e
    puts "[LibraryError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
