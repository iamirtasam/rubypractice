# Practice: Exception Handling and Custom Errors

class VendingMachineError < StandardError
  def initialize(msg = "invalid report output")
    super
  end
end

class VendingMachine
  MIN_OUTPUT = 2
  MAX_OUTPUT = 114

  def initialize(report)
    @report = report
    @output = 0
  end

  def set_output(val)
    raise ArgumentError, "output must be a number" unless val.is_a?(Numeric)
    raise VendingMachineError, "output \#{val} out of [2,114] range" unless (2..114).include?(val)
    @output = val
  end

  def output
    raise VendingMachineError, "output not set" if @output.zero?
    @output
  end
end

test_values = [27, -3, 139, 96]

obj = VendingMachine.new("report_test")
test_values.each do |val|
  begin
    obj.set_output(val)
    puts "Set output = \#{val} => OK (stored: \#{obj.output})"
  rescue VendingMachineError => e
    puts "[VendingMachineError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
