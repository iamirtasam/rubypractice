# Practice: Exception Handling and Custom Errors

class ContactBookError < StandardError
  def initialize(msg = "invalid product length")
    super
  end
end

class ContactBook
  MIN_LENGTH = 3
  MAX_LENGTH = 63

  def initialize(product)
    @product = product
    @length = 0
  end

  def set_length(val)
    raise ArgumentError, "length must be a number" unless val.is_a?(Numeric)
    raise ContactBookError, "length \#{val} out of [3,63] range" unless (3..63).include?(val)
    @length = val
  end

  def length
    raise ContactBookError, "length not set" if @length.zero?
    @length
  end
end

test_values = [27, -2, 88, 27]

obj = ContactBook.new("product_test")
test_values.each do |val|
  begin
    obj.set_length(val)
    puts "Set length = \#{val} => OK (stored: \#{obj.length})"
  rescue ContactBookError => e
    puts "[ContactBookError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
