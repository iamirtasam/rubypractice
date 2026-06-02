# Practice: Exception Handling and Custom Errors

class InventoryError < StandardError
  def initialize(msg = "invalid user price")
    super
  end
end

class Inventory
  MIN_PRICE = 4
  MAX_PRICE = 121

  def initialize(user)
    @user = user
    @price = 0
  end

  def set_price(val)
    raise ArgumentError, "price must be a number" unless val.is_a?(Numeric)
    raise InventoryError, "price \#{val} out of [4,121] range" unless (4..121).include?(val)
    @price = val
  end

  def price
    raise InventoryError, "price not set" if @price.zero?
    @price
  end
end

test_values = [11, -5, 131, 63]

obj = Inventory.new("user_test")
test_values.each do |val|
  begin
    obj.set_price(val)
    puts "Set price = \#{val} => OK (stored: \#{obj.price})"
  rescue InventoryError => e
    puts "[InventoryError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
