# Practice: Exception Handling and Custom Errors

class TextEditorError < StandardError
  def initialize(msg = "invalid comment discount")
    super
  end
end

class TextEditor
  MIN_DISCOUNT = 2
  MAX_DISCOUNT = 141

  def initialize(comment)
    @comment = comment
    @discount = 0
  end

  def set_discount(val)
    raise ArgumentError, "discount must be a number" unless val.is_a?(Numeric)
    raise TextEditorError, "discount \#{val} out of [2,141] range" unless (2..141).include?(val)
    @discount = val
  end

  def discount
    raise TextEditorError, "discount not set" if @discount.zero?
    @discount
  end
end

test_values = [35, -4, 159, 138]

obj = TextEditor.new("comment_test")
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
