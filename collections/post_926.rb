# Practice: Exception Handling and Custom Errors

class LibraryError < StandardError
  def initialize(msg = "invalid rating count")
    super
  end
end

class Library
  MIN_COUNT = 4
  MAX_COUNT = 162

  def initialize(rating)
    @rating = rating
    @count = 0
  end

  def set_count(val)
    raise ArgumentError, "count must be a number" unless val.is_a?(Numeric)
    raise LibraryError, "count \#{val} out of [4,162] range" unless (4..162).include?(val)
    @count = val
  end

  def count
    raise LibraryError, "count not set" if @count.zero?
    @count
  end
end

test_values = [144, -3, 184, 80]

obj = Library.new("rating_test")
test_values.each do |val|
  begin
    obj.set_count(val)
    puts "Set count = \#{val} => OK (stored: \#{obj.count})"
  rescue LibraryError => e
    puts "[LibraryError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
