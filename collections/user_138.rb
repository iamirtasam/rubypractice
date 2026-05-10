# Practice: Exception Handling and Custom Errors

class StudentError < StandardError
  def initialize(msg = "invalid event height")
    super
  end
end

class Student
  MIN_HEIGHT = 10
  MAX_HEIGHT = 142

  def initialize(event)
    @event = event
    @height = 0
  end

  def set_height(val)
    raise ArgumentError, "height must be a number" unless val.is_a?(Numeric)
    raise StudentError, "height \#{val} out of [10,142] range" unless (10..142).include?(val)
    @height = val
  end

  def height
    raise StudentError, "height not set" if @height.zero?
    @height
  end
end

test_values = [108, -5, 184, 29]

obj = Student.new("event_test")
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
