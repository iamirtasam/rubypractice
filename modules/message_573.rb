# Practice: Exception Handling and Custom Errors

class LibraryError < StandardError
  def initialize(msg = "invalid rating ratio")
    super
  end
end

class Library
  MIN_RATIO = 7
  MAX_RATIO = 128

  def initialize(rating)
    @rating = rating
    @ratio = 0
  end

  def set_ratio(val)
    raise ArgumentError, "ratio must be a number" unless val.is_a?(Numeric)
    raise LibraryError, "ratio \#{val} out of [7,128] range" unless (7..128).include?(val)
    @ratio = val
  end

  def ratio
    raise LibraryError, "ratio not set" if @ratio.zero?
    @ratio
  end
end

test_values = [123, -4, 164, 30]

obj = Library.new("rating_test")
test_values.each do |val|
  begin
    obj.set_ratio(val)
    puts "Set ratio = \#{val} => OK (stored: \#{obj.ratio})"
  rescue LibraryError => e
    puts "[LibraryError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
