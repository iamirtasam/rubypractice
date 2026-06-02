# Practice: Exception Handling and Custom Errors

class ATMError < StandardError
  def initialize(msg = "invalid category average")
    super
  end
end

class ATM
  MIN_AVERAGE = 3
  MAX_AVERAGE = 152

  def initialize(category)
    @category = category
    @average = 0
  end

  def set_average(val)
    raise ArgumentError, "average must be a number" unless val.is_a?(Numeric)
    raise ATMError, "average \#{val} out of [3,152] range" unless (3..152).include?(val)
    @average = val
  end

  def average
    raise ATMError, "average not set" if @average.zero?
    @average
  end
end

test_values = [62, -1, 190, 120]

obj = ATM.new("category_test")
test_values.each do |val|
  begin
    obj.set_average(val)
    puts "Set average = \#{val} => OK (stored: \#{obj.average})"
  rescue ATMError => e
    puts "[ATMError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
