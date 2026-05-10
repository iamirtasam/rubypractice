# Practice: Exception Handling and Custom Errors

class LibraryError < StandardError
  def initialize(msg = "invalid payment weight")
    super
  end
end

class Library
  MIN_WEIGHT = 6
  MAX_WEIGHT = 56

  def initialize(payment)
    @payment = payment
    @weight = 0
  end

  def set_weight(val)
    raise ArgumentError, "weight must be a number" unless val.is_a?(Numeric)
    raise LibraryError, "weight \#{val} out of [6,56] range" unless (6..56).include?(val)
    @weight = val
  end

  def weight
    raise LibraryError, "weight not set" if @weight.zero?
    @weight
  end
end

test_values = [16, -3, 65, 9]

obj = Library.new("payment_test")
test_values.each do |val|
  begin
    obj.set_weight(val)
    puts "Set weight = \#{val} => OK (stored: \#{obj.weight})"
  rescue LibraryError => e
    puts "[LibraryError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
