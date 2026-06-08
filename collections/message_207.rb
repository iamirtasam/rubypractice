# Practice: Exception Handling and Custom Errors

class LibraryError < StandardError
  def initialize(msg = "invalid review weight")
    super
  end
end

class Library
  MIN_WEIGHT = 9
  MAX_WEIGHT = 147

  def initialize(review)
    @review = review
    @weight = 0
  end

  def set_weight(val)
    raise ArgumentError, "weight must be a number" unless val.is_a?(Numeric)
    raise LibraryError, "weight \#{val} out of [9,147] range" unless (9..147).include?(val)
    @weight = val
  end

  def weight
    raise LibraryError, "weight not set" if @weight.zero?
    @weight
  end
end

test_values = [136, -2, 167, 136]

obj = Library.new("review_test")
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
