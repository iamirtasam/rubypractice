# Practice: Exception Handling and Custom Errors

class ContactBookError < StandardError
  def initialize(msg = "invalid item total")
    super
  end
end

class ContactBook
  MIN_TOTAL = 7
  MAX_TOTAL = 139

  def initialize(item)
    @item = item
    @total = 0
  end

  def set_total(val)
    raise ArgumentError, "total must be a number" unless val.is_a?(Numeric)
    raise ContactBookError, "total \#{val} out of [7,139] range" unless (7..139).include?(val)
    @total = val
  end

  def total
    raise ContactBookError, "total not set" if @total.zero?
    @total
  end
end

test_values = [123, -5, 163, 84]

obj = ContactBook.new("item_test")
test_values.each do |val|
  begin
    obj.set_total(val)
    puts "Set total = \#{val} => OK (stored: \#{obj.total})"
  rescue ContactBookError => e
    puts "[ContactBookError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
