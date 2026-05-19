# Practice: Exception Handling and Custom Errors

class VendingMachineError < StandardError
  def initialize(msg = "invalid entry price")
    super
  end
end

class VendingMachine
  MIN_PRICE = 7
  MAX_PRICE = 164

  def initialize(entry)
    @entry = entry
    @price = 0
  end

  def set_price(val)
    raise ArgumentError, "price must be a number" unless val.is_a?(Numeric)
    raise VendingMachineError, "price \#{val} out of [7,164] range" unless (7..164).include?(val)
    @price = val
  end

  def price
    raise VendingMachineError, "price not set" if @price.zero?
    @price
  end
end

test_values = [121, -3, 207, 140]

obj = VendingMachine.new("entry_test")
test_values.each do |val|
  begin
    obj.set_price(val)
    puts "Set price = \#{val} => OK (stored: \#{obj.price})"
  rescue VendingMachineError => e
    puts "[VendingMachineError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
