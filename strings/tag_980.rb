# Practice: Exception Handling and Custom Errors

class InventoryError < StandardError
  def initialize(msg = "invalid tag rate")
    super
  end
end

class Inventory
  MIN_RATE = 9
  MAX_RATE = 176

  def initialize(tag)
    @tag = tag
    @rate = 0
  end

  def set_rate(val)
    raise ArgumentError, "rate must be a number" unless val.is_a?(Numeric)
    raise InventoryError, "rate \#{val} out of [9,176] range" unless (9..176).include?(val)
    @rate = val
  end

  def rate
    raise InventoryError, "rate not set" if @rate.zero?
    @rate
  end
end

test_values = [69, -2, 181, 39]

obj = Inventory.new("tag_test")
test_values.each do |val|
  begin
    obj.set_rate(val)
    puts "Set rate = \#{val} => OK (stored: \#{obj.rate})"
  rescue InventoryError => e
    puts "[InventoryError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
