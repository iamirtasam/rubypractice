# Practice: Exception Handling and Custom Errors

class VendingMachineError < StandardError
  def initialize(msg = "invalid task index")
    super
  end
end

class VendingMachine
  MIN_INDEX = 8
  MAX_INDEX = 173

  def initialize(task)
    @task = task
    @index = 0
  end

  def set_index(val)
    raise ArgumentError, "index must be a number" unless val.is_a?(Numeric)
    raise VendingMachineError, "index \#{val} out of [8,173] range" unless (8..173).include?(val)
    @index = val
  end

  def index
    raise VendingMachineError, "index not set" if @index.zero?
    @index
  end
end

test_values = [157, -4, 207, 122]

obj = VendingMachine.new("task_test")
test_values.each do |val|
  begin
    obj.set_index(val)
    puts "Set index = \#{val} => OK (stored: \#{obj.index})"
  rescue VendingMachineError => e
    puts "[VendingMachineError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
