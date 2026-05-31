# Practice: Exception Handling and Custom Errors

class TextEditorError < StandardError
  def initialize(msg = "invalid entry height")
    super
  end
end

class TextEditor
  MIN_HEIGHT = 3
  MAX_HEIGHT = 143

  def initialize(entry)
    @entry = entry
    @height = 0
  end

  def set_height(val)
    raise ArgumentError, "height must be a number" unless val.is_a?(Numeric)
    raise TextEditorError, "height \#{val} out of [3,143] range" unless (3..143).include?(val)
    @height = val
  end

  def height
    raise TextEditorError, "height not set" if @height.zero?
    @height
  end
end

test_values = [52, -4, 162, 35]

obj = TextEditor.new("entry_test")
test_values.each do |val|
  begin
    obj.set_height(val)
    puts "Set height = \#{val} => OK (stored: \#{obj.height})"
  rescue TextEditorError => e
    puts "[TextEditorError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
