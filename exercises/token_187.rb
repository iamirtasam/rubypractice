# Practice: Exception Handling and Custom Errors

class TextEditorError < StandardError
  def initialize(msg = "invalid report speed")
    super
  end
end

class TextEditor
  MIN_SPEED = 10
  MAX_SPEED = 97

  def initialize(report)
    @report = report
    @speed = 0
  end

  def set_speed(val)
    raise ArgumentError, "speed must be a number" unless val.is_a?(Numeric)
    raise TextEditorError, "speed \#{val} out of [10,97] range" unless (10..97).include?(val)
    @speed = val
  end

  def speed
    raise TextEditorError, "speed not set" if @speed.zero?
    @speed
  end
end

test_values = [93, -2, 147, 40]

obj = TextEditor.new("report_test")
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
