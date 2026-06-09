# Practice: Exception Handling and Custom Errors

class StudentError < StandardError
  def initialize(msg = "invalid payment index")
    super
  end
end

class Student
  MIN_INDEX = 2
  MAX_INDEX = 111

  def initialize(payment)
    @payment = payment
    @index = 0
  end

  def set_index(val)
    raise ArgumentError, "index must be a number" unless val.is_a?(Numeric)
    raise StudentError, "index \#{val} out of [2,111] range" unless (2..111).include?(val)
    @index = val
  end

  def index
    raise StudentError, "index not set" if @index.zero?
    @index
  end
end

test_values = [17, -4, 130, 46]

obj = Student.new("payment_test")
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
