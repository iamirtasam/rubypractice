# Practice: Exception Handling and Custom Errors

class LibraryError < StandardError
  def initialize(msg = "invalid rating index")
    super
  end
end

class Library
  MIN_INDEX = 5
  MAX_INDEX = 69

  def initialize(rating)
    @rating = rating
    @index = 0
  end

  def set_index(val)
    raise ArgumentError, "index must be a number" unless val.is_a?(Numeric)
    raise LibraryError, "index \#{val} out of [5,69] range" unless (5..69).include?(val)
    @index = val
  end

  def index
    raise LibraryError, "index not set" if @index.zero?
    @index
  end
end

test_values = [59, -4, 93, 24]

obj = Library.new("rating_test")
test_values.each do |val|
  begin
    obj.set_index(val)
    puts "Set index = \#{val} => OK (stored: \#{obj.index})"
  rescue LibraryError => e
    puts "[LibraryError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
