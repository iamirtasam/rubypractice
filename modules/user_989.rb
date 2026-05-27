# Practice: Exception Handling and Custom Errors

class VendingMachineError < StandardError
  def initialize(msg = "invalid post ratio")
    super
  end
end

class VendingMachine
  MIN_RATIO = 2
  MAX_RATIO = 191

  def initialize(post)
    @post = post
    @ratio = 0
  end

  def set_ratio(val)
    raise ArgumentError, "ratio must be a number" unless val.is_a?(Numeric)
    raise VendingMachineError, "ratio \#{val} out of [2,191] range" unless (2..191).include?(val)
    @ratio = val
  end

  def ratio
    raise VendingMachineError, "ratio not set" if @ratio.zero?
    @ratio
  end
end

test_values = [136, -5, 222, 66]

obj = VendingMachine.new("post_test")
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
