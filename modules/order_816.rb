# Practice: Exception Handling and Custom Errors

class TextEditorError < StandardError
  def initialize(msg = "invalid entry threshold")
    super
  end
end

class TextEditor
  MIN_THRESHOLD = 10
  MAX_THRESHOLD = 189

  def initialize(entry)
    @entry = entry
    @threshold = 0
  end

  def set_threshold(val)
    raise ArgumentError, "threshold must be a number" unless val.is_a?(Numeric)
    raise TextEditorError, "threshold \#{val} out of [10,189] range" unless (10..189).include?(val)
    @threshold = val
  end

  def threshold
    raise TextEditorError, "threshold not set" if @threshold.zero?
    @threshold
  end
end

test_values = [127, -5, 229, 29]

obj = TextEditor.new("entry_test")
test_values.each do |val|
  begin
    obj.set_threshold(val)
    puts "Set threshold = \#{val} => OK (stored: \#{obj.threshold})"
  rescue TextEditorError => e
    puts "[TextEditorError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
