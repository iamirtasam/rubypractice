# Practice: Exception Handling and Custom Errors

class BankAccountError < StandardError
  def initialize(msg = "invalid comment width")
    super
  end
end

class BankAccount
  MIN_WIDTH = 9
  MAX_WIDTH = 166

  def initialize(comment)
    @comment = comment
    @width = 0
  end

  def set_width(val)
    raise ArgumentError, "width must be a number" unless val.is_a?(Numeric)
    raise BankAccountError, "width \#{val} out of [9,166] range" unless (9..166).include?(val)
    @width = val
  end

  def width
    raise BankAccountError, "width not set" if @width.zero?
    @width
  end
end

test_values = [164, -3, 216, 42]

obj = BankAccount.new("comment_test")
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
