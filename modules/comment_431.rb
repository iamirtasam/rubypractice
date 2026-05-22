# Practice: Exception Handling and Custom Errors

class TextEditorError < StandardError
  def initialize(msg = "invalid session result")
    super
  end
end

class TextEditor
  MIN_RESULT = 2
  MAX_RESULT = 149

  def initialize(session)
    @session = session
    @result = 0
  end

  def set_result(val)
    raise ArgumentError, "result must be a number" unless val.is_a?(Numeric)
    raise TextEditorError, "result \#{val} out of [2,149] range" unless (2..149).include?(val)
    @result = val
  end

  def result
    raise TextEditorError, "result not set" if @result.zero?
    @result
  end
end

test_values = [96, -4, 189, 111]

obj = TextEditor.new("session_test")
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
