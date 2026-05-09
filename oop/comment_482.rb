# Practice: Exception Handling and Custom Errors

class BookStoreError < StandardError
  def initialize(msg = "invalid item discount")
    super
  end
end

class BookStore
  MIN_DISCOUNT = 5
  MAX_DISCOUNT = 92

  def initialize(item)
    @item = item
    @discount = 0
  end

  def set_discount(val)
    raise ArgumentError, "discount must be a number" unless val.is_a?(Numeric)
    raise BookStoreError, "discount \#{val} out of [5,92] range" unless (5..92).include?(val)
    @discount = val
  end

  def discount
    raise BookStoreError, "discount not set" if @discount.zero?
    @discount
  end
end

test_values = [74, -2, 108, 77]

obj = BookStore.new("item_test")
test_values.each do |val|
  begin
    obj.set_discount(val)
    puts "Set discount = \#{val} => OK (stored: \#{obj.discount})"
  rescue BookStoreError => e
    puts "[BookStoreError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
