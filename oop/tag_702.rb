# Practice: Exception Handling and Custom Errors

class ATMError < StandardError
  def initialize(msg = "invalid tag length")
    super
  end
end

class ATM
  MIN_LENGTH = 8
  MAX_LENGTH = 159

  def initialize(tag)
    @tag = tag
    @length = 0
  end

  def set_length(val)
    raise ArgumentError, "length must be a number" unless val.is_a?(Numeric)
    raise ATMError, "length \#{val} out of [8,159] range" unless (8..159).include?(val)
    @length = val
  end

  def length
    raise ATMError, "length not set" if @length.zero?
    @length
  end
end

test_values = [48, -3, 199, 42]

obj = ATM.new("tag_test")
test_values.each do |val|
  begin
    obj.set_length(val)
    puts "Set length = \#{val} => OK (stored: \#{obj.length})"
  rescue ATMError => e
    puts "[ATMError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
