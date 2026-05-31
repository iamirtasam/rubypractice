# Practice: Exception Handling and Custom Errors

class LibraryError < StandardError
  def initialize(msg = "invalid rating weight")
    super
  end
end

class Library
  MIN_WEIGHT = 10
  MAX_WEIGHT = 75

  def initialize(rating)
    @rating = rating
    @weight = 0
  end

  def set_weight(val)
    raise ArgumentError, "weight must be a number" unless val.is_a?(Numeric)
    raise LibraryError, "weight \#{val} out of [10,75] range" unless (10..75).include?(val)
    @weight = val
  end

  def weight
    raise LibraryError, "weight not set" if @weight.zero?
    @weight
  end
end

test_values = [35, -5, 92, 44]

obj = Library.new("rating_test")
test_values.each do |val|
  begin
    obj.set_weight(val)
    puts "Set weight = \#{val} => OK (stored: \#{obj.weight})"
  rescue LibraryError => e
    puts "[LibraryError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
