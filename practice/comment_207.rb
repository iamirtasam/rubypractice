# Practice: Exception Handling and Custom Errors

class TextEditorError < StandardError
  def initialize(msg = "invalid entry rate")
    super
  end
end

class TextEditor
  MIN_RATE = 9
  MAX_RATE = 63

  def initialize(entry)
    @entry = entry
    @rate = 0
  end

  def set_rate(val)
    raise ArgumentError, "rate must be a number" unless val.is_a?(Numeric)
    raise TextEditorError, "rate \#{val} out of [9,63] range" unless (9..63).include?(val)
    @rate = val
  end

  def rate
    raise TextEditorError, "rate not set" if @rate.zero?
    @rate
  end
end

test_values = [28, -2, 73, 14]

obj = TextEditor.new("entry_test")
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
