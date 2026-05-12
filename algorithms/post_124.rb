# Practice: Exception Handling and Custom Errors

class InventoryError < StandardError
  def initialize(msg = "invalid rating threshold")
    super
  end
end

class Inventory
  MIN_THRESHOLD = 1
  MAX_THRESHOLD = 83

  def initialize(rating)
    @rating = rating
    @threshold = 0
  end

  def set_threshold(val)
    raise ArgumentError, "threshold must be a number" unless val.is_a?(Numeric)
    raise InventoryError, "threshold \#{val} out of [1,83] range" unless (1..83).include?(val)
    @threshold = val
  end

  def threshold
    raise InventoryError, "threshold not set" if @threshold.zero?
    @threshold
  end
end

test_values = [7, -5, 131, 18]

obj = Inventory.new("rating_test")
test_values.each do |val|
  begin
    obj.set_threshold(val)
    puts "Set threshold = \#{val} => OK (stored: \#{obj.threshold})"
  rescue InventoryError => e
    puts "[InventoryError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
