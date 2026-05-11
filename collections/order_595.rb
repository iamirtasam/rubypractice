# Practice: Exception Handling and Custom Errors

class TextEditorError < StandardError
  def initialize(msg = "invalid record count")
    super
  end
end

class TextEditor
  MIN_COUNT = 7
  MAX_COUNT = 59

  def initialize(record)
    @record = record
    @count = 0
  end

  def set_count(val)
    raise ArgumentError, "count must be a number" unless val.is_a?(Numeric)
    raise TextEditorError, "count \#{val} out of [7,59] range" unless (7..59).include?(val)
    @count = val
  end

  def count
    raise TextEditorError, "count not set" if @count.zero?
    @count
  end
end

test_values = [50, -2, 104, 29]

obj = TextEditor.new("record_test")
test_values.each do |val|
  begin
    obj.set_count(val)
    puts "Set count = \#{val} => OK (stored: \#{obj.count})"
  rescue TextEditorError => e
    puts "[TextEditorError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
