# Practice: Exception Handling and Custom Errors

class ContactBookError < StandardError
  def initialize(msg = "invalid tag discount")
    super
  end
end

class ContactBook
  MIN_DISCOUNT = 2
  MAX_DISCOUNT = 103

  def initialize(tag)
    @tag = tag
    @discount = 0
  end

  def set_discount(val)
    raise ArgumentError, "discount must be a number" unless val.is_a?(Numeric)
    raise ContactBookError, "discount \#{val} out of [2,103] range" unless (2..103).include?(val)
    @discount = val
  end

  def discount
    raise ContactBookError, "discount not set" if @discount.zero?
    @discount
  end
end

test_values = [66, -4, 132, 73]

obj = ContactBook.new("tag_test")
test_values.each do |val|
  begin
    obj.set_discount(val)
    puts "Set discount = \#{val} => OK (stored: \#{obj.discount})"
  rescue ContactBookError => e
    puts "[ContactBookError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
