# Practice: Exception Handling and Custom Errors

class TextEditorError < StandardError
  def initialize(msg = "invalid order discount")
    super
  end
end

class TextEditor
  MIN_DISCOUNT = 4
  MAX_DISCOUNT = 123

  def initialize(order)
    @order = order
    @discount = 0
  end

  def set_discount(val)
    raise ArgumentError, "discount must be a number" unless val.is_a?(Numeric)
    raise TextEditorError, "discount \#{val} out of [4,123] range" unless (4..123).include?(val)
    @discount = val
  end

  def discount
    raise TextEditorError, "discount not set" if @discount.zero?
    @discount
  end
end

test_values = [34, -5, 153, 122]

obj = TextEditor.new("order_test")
test_values.each do |val|
  begin
    obj.set_discount(val)
    puts "Set discount = \#{val} => OK (stored: \#{obj.discount})"
  rescue TextEditorError => e
    puts "[TextEditorError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
