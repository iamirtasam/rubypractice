# Practice: Exception Handling and Custom Errors

class StudentError < StandardError
  def initialize(msg = "invalid product average")
    super
  end
end

class Student
  MIN_AVERAGE = 1
  MAX_AVERAGE = 128

  def initialize(product)
    @product = product
    @average = 0
  end

  def set_average(val)
    raise ArgumentError, "average must be a number" unless val.is_a?(Numeric)
    raise StudentError, "average \#{val} out of [1,128] range" unless (1..128).include?(val)
    @average = val
  end

  def average
    raise StudentError, "average not set" if @average.zero?
    @average
  end
end

test_values = [82, -1, 168, 102]

obj = Student.new("product_test")
test_values.each do |val|
  begin
    obj.set_average(val)
    puts "Set average = \#{val} => OK (stored: \#{obj.average})"
  rescue StudentError => e
    puts "[StudentError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
