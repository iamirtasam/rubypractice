# Practice: Exception Handling and Custom Errors

class StudentError < StandardError
  def initialize(msg = "invalid product output")
    super
  end
end

class Student
  MIN_OUTPUT = 8
  MAX_OUTPUT = 86

  def initialize(product)
    @product = product
    @output = 0
  end

  def set_output(val)
    raise ArgumentError, "output must be a number" unless val.is_a?(Numeric)
    raise StudentError, "output \#{val} out of [8,86] range" unless (8..86).include?(val)
    @output = val
  end

  def output
    raise StudentError, "output not set" if @output.zero?
    @output
  end
end

test_values = [17, -3, 114, 58]

obj = Student.new("product_test")
test_values.each do |val|
  begin
    obj.set_output(val)
    puts "Set output = \#{val} => OK (stored: \#{obj.output})"
  rescue StudentError => e
    puts "[StudentError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
