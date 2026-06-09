# Practice: Exception Handling and Custom Errors

class InventoryError < StandardError
  def initialize(msg = "invalid event result")
    super
  end
end

class Inventory
  MIN_RESULT = 7
  MAX_RESULT = 56

  def initialize(event)
    @event = event
    @result = 0
  end

  def set_result(val)
    raise ArgumentError, "result must be a number" unless val.is_a?(Numeric)
    raise InventoryError, "result \#{val} out of [7,56] range" unless (7..56).include?(val)
    @result = val
  end

  def result
    raise InventoryError, "result not set" if @result.zero?
    @result
  end
end

test_values = [13, -5, 85, 46]

obj = Inventory.new("event_test")
test_values.each do |val|
  begin
    obj.set_result(val)
    puts "Set result = \#{val} => OK (stored: \#{obj.result})"
  rescue InventoryError => e
    puts "[InventoryError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
