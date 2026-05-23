# Practice: Exception Handling and Custom Errors

class TextEditorError < StandardError
  def initialize(msg = "invalid message value")
    super
  end
end

class TextEditor
  MIN_VALUE = 9
  MAX_VALUE = 131

  def initialize(message)
    @message = message
    @value = 0
  end

  def set_value(val)
    raise ArgumentError, "value must be a number" unless val.is_a?(Numeric)
    raise TextEditorError, "value \#{val} out of [9,131] range" unless (9..131).include?(val)
    @value = val
  end

  def value
    raise TextEditorError, "value not set" if @value.zero?
    @value
  end
end

test_values = [55, -2, 153, 76]

obj = TextEditor.new("message_test")
test_values.each do |val|
  begin
    obj.set_value(val)
    puts "Set value = \#{val} => OK (stored: \#{obj.value})"
  rescue TextEditorError => e
    puts "[TextEditorError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
