# Practice: Exception Handling and Custom Errors

class InventoryError < StandardError
  def initialize(msg = "invalid order limit")
    super
  end
end

class Inventory
  MIN_LIMIT = 5
  MAX_LIMIT = 174

  def initialize(order)
    @order = order
    @limit = 0
  end

  def set_limit(val)
    raise ArgumentError, "limit must be a number" unless val.is_a?(Numeric)
    raise InventoryError, "limit \#{val} out of [5,174] range" unless (5..174).include?(val)
    @limit = val
  end

  def limit
    raise InventoryError, "limit not set" if @limit.zero?
    @limit
  end
end

test_values = [78, -3, 199, 91]

obj = Inventory.new("order_test")
test_values.each do |val|
  begin
    obj.set_limit(val)
    puts "Set limit = \#{val} => OK (stored: \#{obj.limit})"
  rescue InventoryError => e
    puts "[InventoryError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
