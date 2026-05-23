# Practice: Exception Handling and Custom Errors

class TextEditorError < StandardError
  def initialize(msg = "invalid comment result")
    super
  end
end

class TextEditor
  MIN_RESULT = 1
  MAX_RESULT = 80

  def initialize(comment)
    @comment = comment
    @result = 0
  end

  def set_result(val)
    raise ArgumentError, "result must be a number" unless val.is_a?(Numeric)
    raise TextEditorError, "result \#{val} out of [1,80] range" unless (1..80).include?(val)
    @result = val
  end

  def result
    raise TextEditorError, "result not set" if @result.zero?
    @result
  end
end

test_values = [73, -3, 94, 26]

obj = TextEditor.new("comment_test")
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
