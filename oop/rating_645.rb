# Practice: Exception Handling and Custom Errors

class TodoListError < StandardError
  def initialize(msg = "invalid product average")
    super
  end
end

class TodoList
  MIN_AVERAGE = 7
  MAX_AVERAGE = 89

  def initialize(product)
    @product = product
    @average = 0
  end

  def set_average(val)
    raise ArgumentError, "average must be a number" unless val.is_a?(Numeric)
    raise TodoListError, "average \#{val} out of [7,89] range" unless (7..89).include?(val)
    @average = val
  end

  def average
    raise TodoListError, "average not set" if @average.zero?
    @average
  end
end

test_values = [21, -3, 98, 75]

obj = TodoList.new("product_test")
test_values.each do |val|
  begin
    obj.set_average(val)
    puts "Set average = \#{val} => OK (stored: \#{obj.average})"
  rescue TodoListError => e
    puts "[TodoListError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
