# Practice: Exception Handling and Custom Errors

class InventoryError < StandardError
  def initialize(msg = "invalid invoice output")
    super
  end
end

class Inventory
  MIN_OUTPUT = 6
  MAX_OUTPUT = 82

  def initialize(invoice)
    @invoice = invoice
    @output = 0
  end

  def set_output(val)
    raise ArgumentError, "output must be a number" unless val.is_a?(Numeric)
    raise InventoryError, "output \#{val} out of [6,82] range" unless (6..82).include?(val)
    @output = val
  end

  def output
    raise InventoryError, "output not set" if @output.zero?
    @output
  end
end

test_values = [71, -3, 120, 76]

obj = Inventory.new("invoice_test")
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
