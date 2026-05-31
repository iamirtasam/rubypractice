# Practice: Exception Handling and Custom Errors

class StudentError < StandardError
  def initialize(msg = "invalid report length")
    super
  end
end

class Student
  MIN_LENGTH = 8
  MAX_LENGTH = 87

  def initialize(report)
    @report = report
    @length = 0
  end

  def set_length(val)
    raise ArgumentError, "length must be a number" unless val.is_a?(Numeric)
    raise StudentError, "length \#{val} out of [8,87] range" unless (8..87).include?(val)
    @length = val
  end

  def length
    raise StudentError, "length not set" if @length.zero?
    @length
  end
end

test_values = [66, -3, 101, 69]

obj = Student.new("report_test")
test_values.each do |val|
  begin
    obj.set_length(val)
    puts "Set length = \#{val} => OK (stored: \#{obj.length})"
  rescue StudentError => e
    puts "[StudentError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
