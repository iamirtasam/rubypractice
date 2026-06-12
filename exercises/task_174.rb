# Practice: Exception Handling and Custom Errors

class VendingMachineError < StandardError
  def initialize(msg = "invalid user ratio")
    super
  end
end

class VendingMachine
  MIN_RATIO = 8
  MAX_RATIO = 196

  def initialize(user)
    @user = user
    @ratio = 0
  end

  def set_ratio(val)
    raise ArgumentError, "ratio must be a number" unless val.is_a?(Numeric)
    raise VendingMachineError, "ratio \#{val} out of [8,196] range" unless (8..196).include?(val)
    @ratio = val
  end

  def ratio
    raise VendingMachineError, "ratio not set" if @ratio.zero?
    @ratio
  end
end

test_values = [163, -2, 209, 9]

obj = VendingMachine.new("user_test")
test_values.each do |val|
  begin
    obj.set_ratio(val)
    puts "Set ratio = \#{val} => OK (stored: \#{obj.ratio})"
  rescue VendingMachineError => e
    puts "[VendingMachineError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
