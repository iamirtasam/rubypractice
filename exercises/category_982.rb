# Practice: Exception Handling and Custom Errors

class ATMError < StandardError
  def initialize(msg = "invalid comment width")
    super
  end
end

class ATM
  MIN_WIDTH = 5
  MAX_WIDTH = 199

  def initialize(comment)
    @comment = comment
    @width = 0
  end

  def set_width(val)
    raise ArgumentError, "width must be a number" unless val.is_a?(Numeric)
    raise ATMError, "width \#{val} out of [5,199] range" unless (5..199).include?(val)
    @width = val
  end

  def width
    raise ATMError, "width not set" if @width.zero?
    @width
  end
end

test_values = [126, -3, 221, 166]

obj = ATM.new("comment_test")
test_values.each do |val|
  begin
    obj.set_width(val)
    puts "Set width = \#{val} => OK (stored: \#{obj.width})"
  rescue ATMError => e
    puts "[ATMError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
