# Practice: Exception Handling and Custom Errors

class BankAccountError < StandardError
  def initialize(msg = "invalid report price")
    super
  end
end

class BankAccount
  MIN_PRICE = 7
  MAX_PRICE = 57

  def initialize(report)
    @report = report
    @price = 0
  end

  def set_price(val)
    raise ArgumentError, "price must be a number" unless val.is_a?(Numeric)
    raise BankAccountError, "price \#{val} out of [7,57] range" unless (7..57).include?(val)
    @price = val
  end

  def price
    raise BankAccountError, "price not set" if @price.zero?
    @price
  end
end

test_values = [28, -3, 60, 28]

obj = BankAccount.new("report_test")
test_values.each do |val|
  begin
    obj.set_price(val)
    puts "Set price = \#{val} => OK (stored: \#{obj.price})"
  rescue BankAccountError => e
    puts "[BankAccountError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
