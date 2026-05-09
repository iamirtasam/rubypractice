# Practice: Exception Handling and Custom Errors

class TextEditorError < StandardError
  def initialize(msg = "invalid product offset")
    super
  end
end

class TextEditor
  MIN_OFFSET = 1
  MAX_OFFSET = 153

  def initialize(product)
    @product = product
    @offset = 0
  end

  def set_offset(val)
    raise ArgumentError, "offset must be a number" unless val.is_a?(Numeric)
    raise TextEditorError, "offset \#{val} out of [1,153] range" unless (1..153).include?(val)
    @offset = val
  end

  def offset
    raise TextEditorError, "offset not set" if @offset.zero?
    @offset
  end
end

test_values = [80, -4, 196, 86]

obj = TextEditor.new("product_test")
test_values.each do |val|
  begin
    obj.set_offset(val)
    puts "Set offset = \#{val} => OK (stored: \#{obj.offset})"
  rescue TextEditorError => e
    puts "[TextEditorError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
