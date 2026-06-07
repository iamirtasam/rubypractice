# Practice: Exception Handling and Custom Errors

class StudentError < StandardError
  def initialize(msg = "invalid product height")
    super
  end
end

class Student
  MIN_HEIGHT = 2
  MAX_HEIGHT = 106

  def initialize(product)
    @product = product
    @height = 0
  end

  def set_height(val)
    raise ArgumentError, "height must be a number" unless val.is_a?(Numeric)
    raise StudentError, "height \#{val} out of [2,106] range" unless (2..106).include?(val)
    @height = val
  end

  def height
    raise StudentError, "height not set" if @height.zero?
    @height
  end
end

test_values = [29, -3, 113, 63]

obj = Student.new("product_test")
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
