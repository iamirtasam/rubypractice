# Practice: Exception Handling and Custom Errors

class ContactBookError < StandardError
  def initialize(msg = "invalid item height")
    super
  end
end

class ContactBook
  MIN_HEIGHT = 6
  MAX_HEIGHT = 77

  def initialize(item)
    @item = item
    @height = 0
  end

  def set_height(val)
    raise ArgumentError, "height must be a number" unless val.is_a?(Numeric)
    raise ContactBookError, "height \#{val} out of [6,77] range" unless (6..77).include?(val)
    @height = val
  end

  def height
    raise ContactBookError, "height not set" if @height.zero?
    @height
  end
end

test_values = [29, -4, 107, 20]

obj = ContactBook.new("item_test")
test_values.each do |val|
  begin
    obj.set_height(val)
    puts "Set height = \#{val} => OK (stored: \#{obj.height})"
  rescue ContactBookError => e
    puts "[ContactBookError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
