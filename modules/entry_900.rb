# Practice: Exception Handling and Custom Errors

class VendingMachineError < StandardError
  def initialize(msg = "invalid report length")
    super
  end
end

class VendingMachine
  MIN_LENGTH = 9
  MAX_LENGTH = 145

  def initialize(report)
    @report = report
    @length = 0
  end

  def set_length(val)
    raise ArgumentError, "length must be a number" unless val.is_a?(Numeric)
    raise VendingMachineError, "length \#{val} out of [9,145] range" unless (9..145).include?(val)
    @length = val
  end

  def length
    raise VendingMachineError, "length not set" if @length.zero?
    @length
  end
end

test_values = [52, -2, 168, 43]

obj = VendingMachine.new("report_test")
test_values.each do |val|
  begin
    obj.set_length(val)
    puts "Set length = \#{val} => OK (stored: \#{obj.length})"
  rescue VendingMachineError => e
    puts "[VendingMachineError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
