# Practice: Exception Handling and Custom Errors

class StudentError < StandardError
  def initialize(msg = "invalid message ratio")
    super
  end
end

class Student
  MIN_RATIO = 6
  MAX_RATIO = 92

  def initialize(message)
    @message = message
    @ratio = 0
  end

  def set_ratio(val)
    raise ArgumentError, "ratio must be a number" unless val.is_a?(Numeric)
    raise StudentError, "ratio \#{val} out of [6,92] range" unless (6..92).include?(val)
    @ratio = val
  end

  def ratio
    raise StudentError, "ratio not set" if @ratio.zero?
    @ratio
  end
end

test_values = [42, -5, 133, 22]

obj = Student.new("message_test")
test_values.each do |val|
  begin
    obj.set_ratio(val)
    puts "Set ratio = \#{val} => OK (stored: \#{obj.ratio})"
  rescue StudentError => e
    puts "[StudentError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
