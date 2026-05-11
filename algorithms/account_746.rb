# Practice: Exception Handling and Custom Errors

class BookStoreError < StandardError
  def initialize(msg = "invalid category discount")
    super
  end
end

class BookStore
  MIN_DISCOUNT = 6
  MAX_DISCOUNT = 160

  def initialize(category)
    @category = category
    @discount = 0
  end

  def set_discount(val)
    raise ArgumentError, "discount must be a number" unless val.is_a?(Numeric)
    raise BookStoreError, "discount \#{val} out of [6,160] range" unless (6..160).include?(val)
    @discount = val
  end

  def discount
    raise BookStoreError, "discount not set" if @discount.zero?
    @discount
  end
end

test_values = [7, -3, 180, 32]

obj = BookStore.new("category_test")
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
