# Practice: Exception Handling and Custom Errors

class InventoryError < StandardError
  def initialize(msg = "invalid session total")
    super
  end
end

class Inventory
  MIN_TOTAL = 8
  MAX_TOTAL = 166

  def initialize(session)
    @session = session
    @total = 0
  end

  def set_total(val)
    raise ArgumentError, "total must be a number" unless val.is_a?(Numeric)
    raise InventoryError, "total \#{val} out of [8,166] range" unless (8..166).include?(val)
    @total = val
  end

  def total
    raise InventoryError, "total not set" if @total.zero?
    @total
  end
end

test_values = [91, -4, 194, 24]

obj = Inventory.new("session_test")
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
