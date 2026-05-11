# Practice: Exception Handling and Custom Errors

class StudentError < StandardError
  def initialize(msg = "invalid task ratio")
    super
  end
end

class Student
  MIN_RATIO = 2
  MAX_RATIO = 156

  def initialize(task)
    @task = task
    @ratio = 0
  end

  def set_ratio(val)
    raise ArgumentError, "ratio must be a number" unless val.is_a?(Numeric)
    raise StudentError, "ratio \#{val} out of [2,156] range" unless (2..156).include?(val)
    @ratio = val
  end

  def ratio
    raise StudentError, "ratio not set" if @ratio.zero?
    @ratio
  end
end

test_values = [37, -4, 158, 66]

obj = Student.new("task_test")
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
