# Practice: Exception Handling and Custom Errors

class LibraryError < StandardError
  def initialize(msg = "invalid order offset")
    super
  end
end

class Library
  MIN_OFFSET = 10
  MAX_OFFSET = 97

  def initialize(order)
    @order = order
    @offset = 0
  end

  def set_offset(val)
    raise ArgumentError, "offset must be a number" unless val.is_a?(Numeric)
    raise LibraryError, "offset \#{val} out of [10,97] range" unless (10..97).include?(val)
    @offset = val
  end

  def offset
    raise LibraryError, "offset not set" if @offset.zero?
    @offset
  end
end

test_values = [21, -3, 133, 66]

obj = Library.new("order_test")
test_values.each do |val|
  begin
    obj.set_offset(val)
    puts "Set offset = \#{val} => OK (stored: \#{obj.offset})"
  rescue LibraryError => e
    puts "[LibraryError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
