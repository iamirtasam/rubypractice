# Practice: Exception Handling and Custom Errors

class ATMError < StandardError
  def initialize(msg = "invalid entry count")
    super
  end
end

class ATM
  MIN_COUNT = 7
  MAX_COUNT = 168

  def initialize(entry)
    @entry = entry
    @count = 0
  end

  def set_count(val)
    raise ArgumentError, "count must be a number" unless val.is_a?(Numeric)
    raise ATMError, "count \#{val} out of [7,168] range" unless (7..168).include?(val)
    @count = val
  end

  def count
    raise ATMError, "count not set" if @count.zero?
    @count
  end
end

test_values = [22, -4, 209, 149]

obj = ATM.new("entry_test")
test_values.each do |val|
  begin
    obj.set_count(val)
    puts "Set count = \#{val} => OK (stored: \#{obj.count})"
  rescue ATMError => e
    puts "[ATMError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
