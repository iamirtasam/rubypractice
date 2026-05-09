# Practice: Exception Handling and Custom Errors

class LibraryError < StandardError
  def initialize(msg = "invalid item output")
    super
  end
end

class Library
  MIN_OUTPUT = 5
  MAX_OUTPUT = 93

  def initialize(item)
    @item = item
    @output = 0
  end

  def set_output(val)
    raise ArgumentError, "output must be a number" unless val.is_a?(Numeric)
    raise LibraryError, "output \#{val} out of [5,93] range" unless (5..93).include?(val)
    @output = val
  end

  def output
    raise LibraryError, "output not set" if @output.zero?
    @output
  end
end

test_values = [52, -4, 103, 92]

obj = Library.new("item_test")
test_values.each do |val|
  begin
    obj.set_output(val)
    puts "Set output = \#{val} => OK (stored: \#{obj.output})"
  rescue LibraryError => e
    puts "[LibraryError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
