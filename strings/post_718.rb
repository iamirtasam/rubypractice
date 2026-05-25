# Practice: Exception Handling and Custom Errors

class LibraryError < StandardError
  def initialize(msg = "invalid order length")
    super
  end
end

class Library
  MIN_LENGTH = 4
  MAX_LENGTH = 176

  def initialize(order)
    @order = order
    @length = 0
  end

  def set_length(val)
    raise ArgumentError, "length must be a number" unless val.is_a?(Numeric)
    raise LibraryError, "length \#{val} out of [4,176] range" unless (4..176).include?(val)
    @length = val
  end

  def length
    raise LibraryError, "length not set" if @length.zero?
    @length
  end
end

test_values = [70, -1, 223, 144]

obj = Library.new("order_test")
test_values.each do |val|
  begin
    obj.set_length(val)
    puts "Set length = \#{val} => OK (stored: \#{obj.length})"
  rescue LibraryError => e
    puts "[LibraryError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
