# Practice: Exception Handling and Custom Errors

class VendingMachineError < StandardError
  def initialize(msg = "invalid comment total")
    super
  end
end

class VendingMachine
  MIN_TOTAL = 5
  MAX_TOTAL = 119

  def initialize(comment)
    @comment = comment
    @total = 0
  end

  def set_total(val)
    raise ArgumentError, "total must be a number" unless val.is_a?(Numeric)
    raise VendingMachineError, "total \#{val} out of [5,119] range" unless (5..119).include?(val)
    @total = val
  end

  def total
    raise VendingMachineError, "total not set" if @total.zero?
    @total
  end
end

test_values = [83, -3, 132, 117]

obj = VendingMachine.new("comment_test")
test_values.each do |val|
  begin
    obj.set_total(val)
    puts "Set total = \#{val} => OK (stored: \#{obj.total})"
  rescue VendingMachineError => e
    puts "[VendingMachineError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
