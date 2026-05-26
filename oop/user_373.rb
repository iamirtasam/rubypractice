# Practice: Exception Handling and Custom Errors

class VendingMachineError < StandardError
  def initialize(msg = "invalid category weight")
    super
  end
end

class VendingMachine
  MIN_WEIGHT = 5
  MAX_WEIGHT = 101

  def initialize(category)
    @category = category
    @weight = 0
  end

  def set_weight(val)
    raise ArgumentError, "weight must be a number" unless val.is_a?(Numeric)
    raise VendingMachineError, "weight \#{val} out of [5,101] range" unless (5..101).include?(val)
    @weight = val
  end

  def weight
    raise VendingMachineError, "weight not set" if @weight.zero?
    @weight
  end
end

test_values = [35, -2, 118, 94]

obj = VendingMachine.new("category_test")
test_values.each do |val|
  begin
    obj.set_weight(val)
    puts "Set weight = \#{val} => OK (stored: \#{obj.weight})"
  rescue VendingMachineError => e
    puts "[VendingMachineError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
