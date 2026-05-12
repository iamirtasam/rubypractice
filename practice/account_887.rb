# Practice: Exception Handling and Custom Errors

class StudentError < StandardError
  def initialize(msg = "invalid record height")
    super
  end
end

class Student
  MIN_HEIGHT = 10
  MAX_HEIGHT = 168

  def initialize(record)
    @record = record
    @height = 0
  end

  def set_height(val)
    raise ArgumentError, "height must be a number" unless val.is_a?(Numeric)
    raise StudentError, "height \#{val} out of [10,168] range" unless (10..168).include?(val)
    @height = val
  end

  def height
    raise StudentError, "height not set" if @height.zero?
    @height
  end
end

test_values = [48, -2, 216, 86]

obj = Student.new("record_test")
test_values.each do |val|
  begin
    obj.set_height(val)
    puts "Set height = \#{val} => OK (stored: \#{obj.height})"
  rescue StudentError => e
    puts "[StudentError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
