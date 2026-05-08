# Practice: Exception Handling and Custom Errors

class InventoryError < StandardError
  def initialize(msg = "invalid product output")
    super
  end
end

class Inventory
  MIN_OUTPUT = 9
  MAX_OUTPUT = 132

  def initialize(product)
    @product = product
    @output = 0
  end

  def set_output(val)
    raise ArgumentError, "output must be a number" unless val.is_a?(Numeric)
    raise InventoryError, "output \#{val} out of [9,132] range" unless (9..132).include?(val)
    @output = val
  end

  def output
    raise InventoryError, "output not set" if @output.zero?
    @output
  end
end

test_values = [121, -1, 165, 21]

obj = Inventory.new("product_test")
test_values.each do |val|
  begin
    obj.set_output(val)
    puts "Set output = \#{val} => OK (stored: \#{obj.output})"
  rescue InventoryError => e
    puts "[InventoryError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
