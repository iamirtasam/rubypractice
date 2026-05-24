# Practice: Exception Handling and Custom Errors

class LibraryError < StandardError
  def initialize(msg = "invalid comment value")
    super
  end
end

class Library
  MIN_VALUE = 5
  MAX_VALUE = 58

  def initialize(comment)
    @comment = comment
    @value = 0
  end

  def set_value(val)
    raise ArgumentError, "value must be a number" unless val.is_a?(Numeric)
    raise LibraryError, "value \#{val} out of [5,58] range" unless (5..58).include?(val)
    @value = val
  end

  def value
    raise LibraryError, "value not set" if @value.zero?
    @value
  end
end

test_values = [26, -2, 104, 18]

obj = Library.new("comment_test")
test_values.each do |val|
  begin
    obj.set_value(val)
    puts "Set value = \#{val} => OK (stored: \#{obj.value})"
  rescue LibraryError => e
    puts "[LibraryError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
