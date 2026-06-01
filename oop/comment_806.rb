# Practice: Exception Handling and Custom Errors

class VendingMachineError < StandardError
  def initialize(msg = "invalid category length")
    super
  end
end

class VendingMachine
  MIN_LENGTH = 6
  MAX_LENGTH = 181

  def initialize(category)
    @category = category
    @length = 0
  end

  def set_length(val)
    raise ArgumentError, "length must be a number" unless val.is_a?(Numeric)
    raise VendingMachineError, "length \#{val} out of [6,181] range" unless (6..181).include?(val)
    @length = val
  end

  def length
    raise VendingMachineError, "length not set" if @length.zero?
    @length
  end
end

test_values = [154, -2, 195, 44]

obj = VendingMachine.new("category_test")
test_values.each do |val|
  begin
    obj.set_length(val)
    puts "Set length = \#{val} => OK (stored: \#{obj.length})"
  rescue VendingMachineError => e
    puts "[VendingMachineError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
