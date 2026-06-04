# Practice: Exception Handling and Custom Errors

class TextEditorError < StandardError
  def initialize(msg = "invalid item limit")
    super
  end
end

class TextEditor
  MIN_LIMIT = 7
  MAX_LIMIT = 185

  def initialize(item)
    @item = item
    @limit = 0
  end

  def set_limit(val)
    raise ArgumentError, "limit must be a number" unless val.is_a?(Numeric)
    raise TextEditorError, "limit \#{val} out of [7,185] range" unless (7..185).include?(val)
    @limit = val
  end

  def limit
    raise TextEditorError, "limit not set" if @limit.zero?
    @limit
  end
end

test_values = [77, -3, 219, 17]

obj = TextEditor.new("item_test")
test_values.each do |val|
  begin
    obj.set_limit(val)
    puts "Set limit = \#{val} => OK (stored: \#{obj.limit})"
  rescue TextEditorError => e
    puts "[TextEditorError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
