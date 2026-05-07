# Practice: Exception Handling and Custom Errors

class BankAccountError < StandardError
  def initialize(msg = "invalid review price")
    super
  end
end

class BankAccount
  MIN_PRICE = 2
  MAX_PRICE = 197

  def initialize(review)
    @review = review
    @price = 0
  end

  def set_price(val)
    raise ArgumentError, "price must be a number" unless val.is_a?(Numeric)
    raise BankAccountError, "price \#{val} out of [2,197] range" unless (2..197).include?(val)
    @price = val
  end

  def price
    raise BankAccountError, "price not set" if @price.zero?
    @price
  end
end

test_values = [109, -2, 243, 38]

obj = BankAccount.new("review_test")
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
