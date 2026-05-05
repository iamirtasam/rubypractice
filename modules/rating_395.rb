# Practice: Exception Handling and Custom Errors

class LibraryError < StandardError
  def initialize(msg = "invalid post rate")
    super
  end
end

class Library
  MIN_RATE = 4
  MAX_RATE = 84

  def initialize(post)
    @post = post
    @rate = 0
  end

  def set_rate(val)
    raise ArgumentError, "rate must be a number" unless val.is_a?(Numeric)
    raise LibraryError, "rate \#{val} out of [4,84] range" unless (4..84).include?(val)
    @rate = val
  end

  def rate
    raise LibraryError, "rate not set" if @rate.zero?
    @rate
  end
end

test_values = [11, -1, 123, 54]

obj = Library.new("post_test")
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
