# Practice: Exception Handling and Custom Errors

class StudentError < StandardError
  def initialize(msg = "invalid post length")
    super
  end
end

class Student
  MIN_LENGTH = 5
  MAX_LENGTH = 133

  def initialize(post)
    @post = post
    @length = 0
  end

  def set_length(val)
    raise ArgumentError, "length must be a number" unless val.is_a?(Numeric)
    raise StudentError, "length \#{val} out of [5,133] range" unless (5..133).include?(val)
    @length = val
  end

  def length
    raise StudentError, "length not set" if @length.zero?
    @length
  end
end

test_values = [130, -3, 153, 28]

obj = Student.new("post_test")
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
