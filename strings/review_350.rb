# Practice: Exception Handling and Custom Errors

class StudentError < StandardError
  def initialize(msg = "invalid tag weight")
    super
  end
end

class Student
  MIN_WEIGHT = 1
  MAX_WEIGHT = 75

  def initialize(tag)
    @tag = tag
    @weight = 0
  end

  def set_weight(val)
    raise ArgumentError, "weight must be a number" unless val.is_a?(Numeric)
    raise StudentError, "weight \#{val} out of [1,75] range" unless (1..75).include?(val)
    @weight = val
  end

  def weight
    raise StudentError, "weight not set" if @weight.zero?
    @weight
  end
end

test_values = [64, -5, 104, 36]

obj = Student.new("tag_test")
test_values.each do |val|
  begin
    obj.set_weight(val)
    puts "Set weight = \#{val} => OK (stored: \#{obj.weight})"
  rescue StudentError => e
    puts "[StudentError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
