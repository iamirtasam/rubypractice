# Practice: Exception Handling and Custom Errors

class TextEditorError < StandardError
  def initialize(msg = "invalid event rate")
    super
  end
end

class TextEditor
  MIN_RATE = 10
  MAX_RATE = 128

  def initialize(event)
    @event = event
    @rate = 0
  end

  def set_rate(val)
    raise ArgumentError, "rate must be a number" unless val.is_a?(Numeric)
    raise TextEditorError, "rate \#{val} out of [10,128] range" unless (10..128).include?(val)
    @rate = val
  end

  def rate
    raise TextEditorError, "rate not set" if @rate.zero?
    @rate
  end
end

test_values = [32, -1, 173, 101]

obj = TextEditor.new("event_test")
test_values.each do |val|
  begin
    obj.set_rate(val)
    puts "Set rate = \#{val} => OK (stored: \#{obj.rate})"
  rescue TextEditorError => e
    puts "[TextEditorError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
