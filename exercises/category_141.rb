# Practice: Exception Handling and Custom Errors

class StudentError < StandardError
  def initialize(msg = "invalid review width")
    super
  end
end

class Student
  MIN_WIDTH = 5
  MAX_WIDTH = 186

  def initialize(review)
    @review = review
    @width = 0
  end

  def set_width(val)
    raise ArgumentError, "width must be a number" unless val.is_a?(Numeric)
    raise StudentError, "width \#{val} out of [5,186] range" unless (5..186).include?(val)
    @width = val
  end

  def width
    raise StudentError, "width not set" if @width.zero?
    @width
  end
end

test_values = [18, -2, 216, 43]

obj = Student.new("review_test")
test_values.each do |val|
  begin
    obj.set_width(val)
    puts "Set width = \#{val} => OK (stored: \#{obj.width})"
  rescue StudentError => e
    puts "[StudentError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
