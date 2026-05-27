# Practice: Exception Handling and Custom Errors

class StudentError < StandardError
  def initialize(msg = "invalid token height")
    super
  end
end

class Student
  MIN_HEIGHT = 4
  MAX_HEIGHT = 166

  def initialize(token)
    @token = token
    @height = 0
  end

  def set_height(val)
    raise ArgumentError, "height must be a number" unless val.is_a?(Numeric)
    raise StudentError, "height \#{val} out of [4,166] range" unless (4..166).include?(val)
    @height = val
  end

  def height
    raise StudentError, "height not set" if @height.zero?
    @height
  end
end

test_values = [130, -3, 197, 117]

obj = Student.new("token_test")
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
