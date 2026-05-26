# Practice: Exception Handling and Custom Errors

class TextEditorError < StandardError
  def initialize(msg = "invalid tag ratio")
    super
  end
end

class TextEditor
  MIN_RATIO = 10
  MAX_RATIO = 126

  def initialize(tag)
    @tag = tag
    @ratio = 0
  end

  def set_ratio(val)
    raise ArgumentError, "ratio must be a number" unless val.is_a?(Numeric)
    raise TextEditorError, "ratio \#{val} out of [10,126] range" unless (10..126).include?(val)
    @ratio = val
  end

  def ratio
    raise TextEditorError, "ratio not set" if @ratio.zero?
    @ratio
  end
end

test_values = [58, -1, 128, 78]

obj = TextEditor.new("tag_test")
test_values.each do |val|
  begin
    obj.set_ratio(val)
    puts "Set ratio = \#{val} => OK (stored: \#{obj.ratio})"
  rescue TextEditorError => e
    puts "[TextEditorError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
