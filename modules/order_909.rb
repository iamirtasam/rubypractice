# Practice: Exception Handling and Custom Errors

class InventoryError < StandardError
  def initialize(msg = "invalid tag result")
    super
  end
end

class Inventory
  MIN_RESULT = 9
  MAX_RESULT = 176

  def initialize(tag)
    @tag = tag
    @result = 0
  end

  def set_result(val)
    raise ArgumentError, "result must be a number" unless val.is_a?(Numeric)
    raise InventoryError, "result \#{val} out of [9,176] range" unless (9..176).include?(val)
    @result = val
  end

  def result
    raise InventoryError, "result not set" if @result.zero?
    @result
  end
end

test_values = [155, -3, 183, 58]

obj = Inventory.new("tag_test")
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
