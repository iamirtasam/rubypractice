# Practice: Exception Handling and Custom Errors

class ATMError < StandardError
  def initialize(msg = "invalid rating index")
    super
  end
end

class ATM
  MIN_INDEX = 6
  MAX_INDEX = 59

  def initialize(rating)
    @rating = rating
    @index = 0
  end

  def set_index(val)
    raise ArgumentError, "index must be a number" unless val.is_a?(Numeric)
    raise ATMError, "index \#{val} out of [6,59] range" unless (6..59).include?(val)
    @index = val
  end

  def index
    raise ATMError, "index not set" if @index.zero?
    @index
  end
end

test_values = [9, -3, 94, 13]

obj = ATM.new("rating_test")
test_values.each do |val|
  begin
    obj.set_index(val)
    puts "Set index = \#{val} => OK (stored: \#{obj.index})"
  rescue ATMError => e
    puts "[ATMError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
