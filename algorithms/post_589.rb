# Practice: Exception Handling and Custom Errors

class BankAccountError < StandardError
  def initialize(msg = "invalid category price")
    super
  end
end

class BankAccount
  MIN_PRICE = 5
  MAX_PRICE = 149

  def initialize(category)
    @category = category
    @price = 0
  end

  def set_price(val)
    raise ArgumentError, "price must be a number" unless val.is_a?(Numeric)
    raise BankAccountError, "price \#{val} out of [5,149] range" unless (5..149).include?(val)
    @price = val
  end

  def price
    raise BankAccountError, "price not set" if @price.zero?
    @price
  end
end

test_values = [127, -3, 164, 5]

obj = BankAccount.new("category_test")
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
