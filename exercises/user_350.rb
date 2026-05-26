# Practice: Exception Handling and Custom Errors

class VendingMachineError < StandardError
  def initialize(msg = "invalid product weight")
    super
  end
end

class VendingMachine
  MIN_WEIGHT = 8
  MAX_WEIGHT = 197

  def initialize(product)
    @product = product
    @weight = 0
  end

  def set_weight(val)
    raise ArgumentError, "weight must be a number" unless val.is_a?(Numeric)
    raise VendingMachineError, "weight \#{val} out of [8,197] range" unless (8..197).include?(val)
    @weight = val
  end

  def weight
    raise VendingMachineError, "weight not set" if @weight.zero?
    @weight
  end
end

test_values = [158, -2, 222, 197]

obj = VendingMachine.new("product_test")
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
