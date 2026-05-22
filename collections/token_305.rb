# Practice: Exception Handling and Custom Errors

class StudentError < StandardError
  def initialize(msg = "invalid token count")
    super
  end
end

class Student
  MIN_COUNT = 9
  MAX_COUNT = 123

  def initialize(token)
    @token = token
    @count = 0
  end

  def set_count(val)
    raise ArgumentError, "count must be a number" unless val.is_a?(Numeric)
    raise StudentError, "count \#{val} out of [9,123] range" unless (9..123).include?(val)
    @count = val
  end

  def count
    raise StudentError, "count not set" if @count.zero?
    @count
  end
end

test_values = [84, -5, 170, 69]

obj = Student.new("token_test")
test_values.each do |val|
  begin
    obj.set_count(val)
    puts "Set count = \#{val} => OK (stored: \#{obj.count})"
  rescue StudentError => e
    puts "[StudentError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
