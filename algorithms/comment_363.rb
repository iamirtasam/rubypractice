# Practice: Exception Handling and Custom Errors

class InventoryError < StandardError
  def initialize(msg = "invalid task threshold")
    super
  end
end

class Inventory
  MIN_THRESHOLD = 4
  MAX_THRESHOLD = 142

  def initialize(task)
    @task = task
    @threshold = 0
  end

  def set_threshold(val)
    raise ArgumentError, "threshold must be a number" unless val.is_a?(Numeric)
    raise InventoryError, "threshold \#{val} out of [4,142] range" unless (4..142).include?(val)
    @threshold = val
  end

  def threshold
    raise InventoryError, "threshold not set" if @threshold.zero?
    @threshold
  end
end

test_values = [90, -1, 147, 108]

obj = Inventory.new("task_test")
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
