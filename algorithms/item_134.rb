# Practice: Exception Handling and Custom Errors

class TextEditorError < StandardError
  def initialize(msg = "invalid category speed")
    super
  end
end

class TextEditor
  MIN_SPEED = 4
  MAX_SPEED = 62

  def initialize(category)
    @category = category
    @speed = 0
  end

  def set_speed(val)
    raise ArgumentError, "speed must be a number" unless val.is_a?(Numeric)
    raise TextEditorError, "speed \#{val} out of [4,62] range" unless (4..62).include?(val)
    @speed = val
  end

  def speed
    raise TextEditorError, "speed not set" if @speed.zero?
    @speed
  end
end

test_values = [6, -5, 81, 46]

obj = TextEditor.new("category_test")
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
