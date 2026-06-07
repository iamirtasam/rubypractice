# Practice: Exception Handling and Custom Errors

class InventoryError < StandardError
  def initialize(msg = "invalid tag width")
    super
  end
end

class Inventory
  MIN_WIDTH = 3
  MAX_WIDTH = 67

  def initialize(tag)
    @tag = tag
    @width = 0
  end

  def set_width(val)
    raise ArgumentError, "width must be a number" unless val.is_a?(Numeric)
    raise InventoryError, "width \#{val} out of [3,67] range" unless (3..67).include?(val)
    @width = val
  end

  def width
    raise InventoryError, "width not set" if @width.zero?
    @width
  end
end

test_values = [30, -3, 90, 45]

obj = Inventory.new("tag_test")
test_values.each do |val|
  begin
    obj.set_width(val)
    puts "Set width = \#{val} => OK (stored: \#{obj.width})"
  rescue InventoryError => e
    puts "[InventoryError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
