# Practice: Exception Handling and Custom Errors

class TextEditorError < StandardError
  def initialize(msg = "invalid order count")
    super
  end
end

class TextEditor
  MIN_COUNT = 6
  MAX_COUNT = 64

  def initialize(order)
    @order = order
    @count = 0
  end

  def set_count(val)
    raise ArgumentError, "count must be a number" unless val.is_a?(Numeric)
    raise TextEditorError, "count \#{val} out of [6,64] range" unless (6..64).include?(val)
    @count = val
  end

  def count
    raise TextEditorError, "count not set" if @count.zero?
    @count
  end
end

test_values = [55, -4, 113, 24]

obj = TextEditor.new("order_test")
test_values.each do |val|
  begin
    obj.set_count(val)
    puts "Set count = \#{val} => OK (stored: \#{obj.count})"
  rescue TextEditorError => e
    puts "[TextEditorError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
