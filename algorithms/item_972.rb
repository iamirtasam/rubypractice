# Practice: Exception Handling and Custom Errors

class StudentError < StandardError
  def initialize(msg = "invalid report total")
    super
  end
end

class Student
  MIN_TOTAL = 2
  MAX_TOTAL = 89

  def initialize(report)
    @report = report
    @total = 0
  end

  def set_total(val)
    raise ArgumentError, "total must be a number" unless val.is_a?(Numeric)
    raise StudentError, "total \#{val} out of [2,89] range" unless (2..89).include?(val)
    @total = val
  end

  def total
    raise StudentError, "total not set" if @total.zero?
    @total
  end
end

test_values = [88, -4, 119, 7]

obj = Student.new("report_test")
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
