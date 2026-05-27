# Practice: Exception Handling and Custom Errors

class InventoryError < StandardError
  def initialize(msg = "invalid record weight")
    super
  end
end

class Inventory
  MIN_WEIGHT = 9
  MAX_WEIGHT = 157

  def initialize(record)
    @record = record
    @weight = 0
  end

  def set_weight(val)
    raise ArgumentError, "weight must be a number" unless val.is_a?(Numeric)
    raise InventoryError, "weight \#{val} out of [9,157] range" unless (9..157).include?(val)
    @weight = val
  end

  def weight
    raise InventoryError, "weight not set" if @weight.zero?
    @weight
  end
end

test_values = [51, -1, 189, 104]

obj = Inventory.new("record_test")
test_values.each do |val|
  begin
    obj.set_weight(val)
    puts "Set weight = \#{val} => OK (stored: \#{obj.weight})"
  rescue InventoryError => e
    puts "[InventoryError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
