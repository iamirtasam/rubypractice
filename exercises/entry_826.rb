# Practice: Exception Handling and Custom Errors

class StudentError < StandardError
  def initialize(msg = "invalid message total")
    super
  end
end

class Student
  MIN_TOTAL = 6
  MAX_TOTAL = 183

  def initialize(message)
    @message = message
    @total = 0
  end

  def set_total(val)
    raise ArgumentError, "total must be a number" unless val.is_a?(Numeric)
    raise StudentError, "total \#{val} out of [6,183] range" unless (6..183).include?(val)
    @total = val
  end

  def total
    raise StudentError, "total not set" if @total.zero?
    @total
  end
end

test_values = [172, -5, 220, 53]

obj = Student.new("message_test")
test_values.each do |val|
  begin
    obj.set_total(val)
    puts "Set total = \#{val} => OK (stored: \#{obj.total})"
  rescue StudentError => e
    puts "[StudentError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
