# Practice: Exception Handling and Custom Errors

class TextEditorError < StandardError
  def initialize(msg = "invalid post offset")
    super
  end
end

class TextEditor
  MIN_OFFSET = 10
  MAX_OFFSET = 144

  def initialize(post)
    @post = post
    @offset = 0
  end

  def set_offset(val)
    raise ArgumentError, "offset must be a number" unless val.is_a?(Numeric)
    raise TextEditorError, "offset \#{val} out of [10,144] range" unless (10..144).include?(val)
    @offset = val
  end

  def offset
    raise TextEditorError, "offset not set" if @offset.zero?
    @offset
  end
end

test_values = [12, -3, 151, 22]

obj = TextEditor.new("post_test")
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
