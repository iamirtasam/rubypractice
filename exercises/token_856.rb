# Practice: Exception Handling and Custom Errors

class LibraryError < StandardError
  def initialize(msg = "invalid post result")
    super
  end
end

class Library
  MIN_RESULT = 2
  MAX_RESULT = 160

  def initialize(post)
    @post = post
    @result = 0
  end

  def set_result(val)
    raise ArgumentError, "result must be a number" unless val.is_a?(Numeric)
    raise LibraryError, "result \#{val} out of [2,160] range" unless (2..160).include?(val)
    @result = val
  end

  def result
    raise LibraryError, "result not set" if @result.zero?
    @result
  end
end

test_values = [74, -3, 192, 34]

obj = Library.new("post_test")
test_values.each do |val|
  begin
    obj.set_result(val)
    puts "Set result = \#{val} => OK (stored: \#{obj.result})"
  rescue LibraryError => e
    puts "[LibraryError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
