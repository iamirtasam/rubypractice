# Practice: Exception Handling and Custom Errors

class StudentError < StandardError
  def initialize(msg = "invalid tag median")
    super
  end
end

class Student
  MIN_MEDIAN = 1
  MAX_MEDIAN = 139

  def initialize(tag)
    @tag = tag
    @median = 0
  end

  def set_median(val)
    raise ArgumentError, "median must be a number" unless val.is_a?(Numeric)
    raise StudentError, "median \#{val} out of [1,139] range" unless (1..139).include?(val)
    @median = val
  end

  def median
    raise StudentError, "median not set" if @median.zero?
    @median
  end
end

test_values = [76, -4, 165, 128]

obj = Student.new("tag_test")
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
