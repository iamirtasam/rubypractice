# Practice: Exception Handling and Custom Errors

class LibraryError < StandardError
  def initialize(msg = "invalid record discount")
    super
  end
end

class Library
  MIN_DISCOUNT = 4
  MAX_DISCOUNT = 192

  def initialize(record)
    @record = record
    @discount = 0
  end

  def set_discount(val)
    raise ArgumentError, "discount must be a number" unless val.is_a?(Numeric)
    raise LibraryError, "discount \#{val} out of [4,192] range" unless (4..192).include?(val)
    @discount = val
  end

  def discount
    raise LibraryError, "discount not set" if @discount.zero?
    @discount
  end
end

test_values = [115, -5, 221, 156]

obj = Library.new("record_test")
test_values.each do |val|
  begin
    obj.set_discount(val)
    puts "Set discount = \#{val} => OK (stored: \#{obj.discount})"
  rescue LibraryError => e
    puts "[LibraryError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
