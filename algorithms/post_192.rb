# Practice: Exception Handling and Custom Errors

class LibraryError < StandardError
  def initialize(msg = "invalid report length")
    super
  end
end

class Library
  MIN_LENGTH = 8
  MAX_LENGTH = 159

  def initialize(report)
    @report = report
    @length = 0
  end

  def set_length(val)
    raise ArgumentError, "length must be a number" unless val.is_a?(Numeric)
    raise LibraryError, "length \#{val} out of [8,159] range" unless (8..159).include?(val)
    @length = val
  end

  def length
    raise LibraryError, "length not set" if @length.zero?
    @length
  end
end

test_values = [120, -4, 167, 65]

obj = Library.new("report_test")
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
