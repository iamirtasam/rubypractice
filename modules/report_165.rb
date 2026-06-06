# Practice: Exception Handling and Custom Errors

class TextEditorError < StandardError
  def initialize(msg = "invalid token result")
    super
  end
end

class TextEditor
  MIN_RESULT = 5
  MAX_RESULT = 79

  def initialize(token)
    @token = token
    @result = 0
  end

  def set_result(val)
    raise ArgumentError, "result must be a number" unless val.is_a?(Numeric)
    raise TextEditorError, "result \#{val} out of [5,79] range" unless (5..79).include?(val)
    @result = val
  end

  def result
    raise TextEditorError, "result not set" if @result.zero?
    @result
  end
end

test_values = [78, -5, 120, 28]

obj = TextEditor.new("token_test")
test_values.each do |val|
  begin
    obj.set_result(val)
    puts "Set result = \#{val} => OK (stored: \#{obj.result})"
  rescue TextEditorError => e
    puts "[TextEditorError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
