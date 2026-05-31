# Practice: Exception Handling and Custom Errors

class TextEditorError < StandardError
  def initialize(msg = "invalid token limit")
    super
  end
end

class TextEditor
  MIN_LIMIT = 10
  MAX_LIMIT = 83

  def initialize(token)
    @token = token
    @limit = 0
  end

  def set_limit(val)
    raise ArgumentError, "limit must be a number" unless val.is_a?(Numeric)
    raise TextEditorError, "limit \#{val} out of [10,83] range" unless (10..83).include?(val)
    @limit = val
  end

  def limit
    raise TextEditorError, "limit not set" if @limit.zero?
    @limit
  end
end

test_values = [43, -3, 97, 20]

obj = TextEditor.new("token_test")
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
