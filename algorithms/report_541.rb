# Practice: Exception Handling and Custom Errors

class TextEditorError < StandardError
  def initialize(msg = "invalid token speed")
    super
  end
end

class TextEditor
  MIN_SPEED = 8
  MAX_SPEED = 102

  def initialize(token)
    @token = token
    @speed = 0
  end

  def set_speed(val)
    raise ArgumentError, "speed must be a number" unless val.is_a?(Numeric)
    raise TextEditorError, "speed \#{val} out of [8,102] range" unless (8..102).include?(val)
    @speed = val
  end

  def speed
    raise TextEditorError, "speed not set" if @speed.zero?
    @speed
  end
end

test_values = [26, -1, 150, 33]

obj = TextEditor.new("token_test")
test_values.each do |val|
  begin
    obj.set_speed(val)
    puts "Set speed = \#{val} => OK (stored: \#{obj.speed})"
  rescue TextEditorError => e
    puts "[TextEditorError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
