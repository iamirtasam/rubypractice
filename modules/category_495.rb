# Practice: Exception Handling and Custom Errors

class StudentError < StandardError
  def initialize(msg = "invalid tag index")
    super
  end
end

class Student
  MIN_INDEX = 4
  MAX_INDEX = 173

  def initialize(tag)
    @tag = tag
    @index = 0
  end

  def set_index(val)
    raise ArgumentError, "index must be a number" unless val.is_a?(Numeric)
    raise StudentError, "index \#{val} out of [4,173] range" unless (4..173).include?(val)
    @index = val
  end

  def index
    raise StudentError, "index not set" if @index.zero?
    @index
  end
end

test_values = [85, -4, 198, 156]

obj = Student.new("tag_test")
test_values.each do |val|
  begin
    obj.set_index(val)
    puts "Set index = \#{val} => OK (stored: \#{obj.index})"
  rescue StudentError => e
    puts "[StudentError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
