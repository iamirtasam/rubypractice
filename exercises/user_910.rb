# Practice: Exception Handling and Custom Errors

class LibraryError < StandardError
  def initialize(msg = "invalid category rate")
    super
  end
end

class Library
  MIN_RATE = 7
  MAX_RATE = 60

  def initialize(category)
    @category = category
    @rate = 0
  end

  def set_rate(val)
    raise ArgumentError, "rate must be a number" unless val.is_a?(Numeric)
    raise LibraryError, "rate \#{val} out of [7,60] range" unless (7..60).include?(val)
    @rate = val
  end

  def rate
    raise LibraryError, "rate not set" if @rate.zero?
    @rate
  end
end

test_values = [42, -1, 106, 48]

obj = Library.new("category_test")
test_values.each do |val|
  begin
    obj.set_rate(val)
    puts "Set rate = \#{val} => OK (stored: \#{obj.rate})"
  rescue LibraryError => e
    puts "[LibraryError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
