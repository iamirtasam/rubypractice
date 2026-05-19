# Practice: Exception Handling and Custom Errors

class ATMError < StandardError
  def initialize(msg = "invalid entry offset")
    super
  end
end

class ATM
  MIN_OFFSET = 1
  MAX_OFFSET = 192

  def initialize(entry)
    @entry = entry
    @offset = 0
  end

  def set_offset(val)
    raise ArgumentError, "offset must be a number" unless val.is_a?(Numeric)
    raise ATMError, "offset \#{val} out of [1,192] range" unless (1..192).include?(val)
    @offset = val
  end

  def offset
    raise ATMError, "offset not set" if @offset.zero?
    @offset
  end
end

test_values = [38, -5, 242, 117]

obj = ATM.new("entry_test")
test_values.each do |val|
  begin
    obj.set_offset(val)
    puts "Set offset = \#{val} => OK (stored: \#{obj.offset})"
  rescue ATMError => e
    puts "[ATMError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
