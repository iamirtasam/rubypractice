# Practice: Exception Handling and Custom Errors

class TextEditorError < StandardError
  def initialize(msg = "invalid entry price")
    super
  end
end

class TextEditor
  MIN_PRICE = 2
  MAX_PRICE = 170

  def initialize(entry)
    @entry = entry
    @price = 0
  end

  def set_price(val)
    raise ArgumentError, "price must be a number" unless val.is_a?(Numeric)
    raise TextEditorError, "price \#{val} out of [2,170] range" unless (2..170).include?(val)
    @price = val
  end

  def price
    raise TextEditorError, "price not set" if @price.zero?
    @price
  end
end

test_values = [5, -5, 176, 140]

obj = TextEditor.new("entry_test")
test_values.each do |val|
  begin
    obj.set_price(val)
    puts "Set price = \#{val} => OK (stored: \#{obj.price})"
  rescue TextEditorError => e
    puts "[TextEditorError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
