# Practice: Exception Handling and Custom Errors

class StudentError < StandardError
  def initialize(msg = "invalid category median")
    super
  end
end

class Student
  MIN_MEDIAN = 10
  MAX_MEDIAN = 55

  def initialize(category)
    @category = category
    @median = 0
  end

  def set_median(val)
    raise ArgumentError, "median must be a number" unless val.is_a?(Numeric)
    raise StudentError, "median \#{val} out of [10,55] range" unless (10..55).include?(val)
    @median = val
  end

  def median
    raise StudentError, "median not set" if @median.zero?
    @median
  end
end

test_values = [48, -4, 103, 25]

obj = Student.new("category_test")
test_values.each do |val|
  begin
    obj.set_median(val)
    puts "Set median = \#{val} => OK (stored: \#{obj.median})"
  rescue StudentError => e
    puts "[StudentError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
