# Practice: Exception Handling and Custom Errors

class TextEditorError < StandardError
  def initialize(msg = "invalid tag width")
    super
  end
end

class TextEditor
  MIN_WIDTH = 7
  MAX_WIDTH = 90

  def initialize(tag)
    @tag = tag
    @width = 0
  end

  def set_width(val)
    raise ArgumentError, "width must be a number" unless val.is_a?(Numeric)
    raise TextEditorError, "width \#{val} out of [7,90] range" unless (7..90).include?(val)
    @width = val
  end

  def width
    raise TextEditorError, "width not set" if @width.zero?
    @width
  end
end

test_values = [27, -5, 137, 71]

obj = TextEditor.new("tag_test")
test_values.each do |val|
  begin
    obj.set_width(val)
    puts "Set width = \#{val} => OK (stored: \#{obj.width})"
  rescue TextEditorError => e
    puts "[TextEditorError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
