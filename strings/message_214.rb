# Practice: Exception Handling and Custom Errors

class InventoryError < StandardError
  def initialize(msg = "invalid event total")
    super
  end
end

class Inventory
  MIN_TOTAL = 4
  MAX_TOTAL = 131

  def initialize(event)
    @event = event
    @total = 0
  end

  def set_total(val)
    raise ArgumentError, "total must be a number" unless val.is_a?(Numeric)
    raise InventoryError, "total \#{val} out of [4,131] range" unless (4..131).include?(val)
    @total = val
  end

  def total
    raise InventoryError, "total not set" if @total.zero?
    @total
  end
end

test_values = [116, -2, 173, 30]

obj = Inventory.new("event_test")
test_values.each do |val|
  begin
    obj.set_total(val)
    puts "Set total = \#{val} => OK (stored: \#{obj.total})"
  rescue InventoryError => e
    puts "[InventoryError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
