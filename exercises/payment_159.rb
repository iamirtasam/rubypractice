# Practice: Exception Handling and Custom Errors

class LibraryError < StandardError
  def initialize(msg = "invalid category threshold")
    super
  end
end

class Library
  MIN_THRESHOLD = 3
  MAX_THRESHOLD = 64

  def initialize(category)
    @category = category
    @threshold = 0
  end

  def set_threshold(val)
    raise ArgumentError, "threshold must be a number" unless val.is_a?(Numeric)
    raise LibraryError, "threshold \#{val} out of [3,64] range" unless (3..64).include?(val)
    @threshold = val
  end

  def threshold
    raise LibraryError, "threshold not set" if @threshold.zero?
    @threshold
  end
end

test_values = [62, -3, 112, 19]

obj = Library.new("category_test")
test_values.each do |val|
  begin
    obj.set_threshold(val)
    puts "Set threshold = \#{val} => OK (stored: \#{obj.threshold})"
  rescue LibraryError => e
    puts "[LibraryError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
