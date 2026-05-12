# Practice: Exception Handling and Custom Errors

class BankAccountError < StandardError
  def initialize(msg = "invalid item width")
    super
  end
end

class BankAccount
  MIN_WIDTH = 5
  MAX_WIDTH = 106

  def initialize(item)
    @item = item
    @width = 0
  end

  def set_width(val)
    raise ArgumentError, "width must be a number" unless val.is_a?(Numeric)
    raise BankAccountError, "width \#{val} out of [5,106] range" unless (5..106).include?(val)
    @width = val
  end

  def width
    raise BankAccountError, "width not set" if @width.zero?
    @width
  end
end

test_values = [13, -2, 138, 73]

obj = BankAccount.new("item_test")
test_values.each do |val|
  begin
    obj.set_width(val)
    puts "Set width = \#{val} => OK (stored: \#{obj.width})"
  rescue BankAccountError => e
    puts "[BankAccountError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
